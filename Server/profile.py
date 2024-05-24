from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/SecurityQuest'  # Replace 'root' with your MySQL username
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class UserInfo(db.Model):
    user_id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(50), nullable=False)
    user_bio = db.Column(db.Text, nullable=True)
    user_pic = db.Column(db.LargeBinary, nullable=True)

class UserApp(db.Model):
    app_id = db.Column(db.Integer, primary_key=True)
    user_points = db.Column(db.Integer, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user_info.user_id'), nullable=False)

class Achievement(db.Model):
    achiev_id = db.Column(db.Integer, primary_key=True)
    badge = db.Column(db.LargeBinary, nullable=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user_info.user_id'), nullable=False)

@app.route('/profile/<int:user_id>', methods=['GET'])
def get_profile(user_id):
    user_info = UserInfo.query.filter_by(user_id=user_id).first()
    user_app = UserApp.query.filter_by(user_id=user_id).first()
    achievements = Achievement.query.filter_by(user_id=user_id).all()

    if not user_info or not user_app:
        return jsonify({'error': 'User not found'}), 404

    badges = [{'achiev_id': achiev.achiev_id, 'badge': achiev.badge} for achiev in achievements]

    profile_data = {
        'name': user_info.user_name,
        'description': user_info.user_bio,
        'profile_picture': user_info.user_pic,
        'points': user_app.user_points,
        'world_rank': user_app.user_points,  # Placeholder for world rank calculation
        'local_rank': user_app.user_points,  # Placeholder for local rank calculation
        'badges': badges
    }

    return jsonify(profile_data), 200

if __name__ == '__main__':
    app.run(debug=True)
