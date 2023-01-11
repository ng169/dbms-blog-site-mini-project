import re
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, validators
from wtforms.validators import DataRequired, Email,URL
from flask_ckeditor import CKEditorField


class LoginForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired(), Email()])
    password = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("LOG IN")


class RegisterForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired(), Email()])
    password = PasswordField("Password", validators=[DataRequired()])
    name = StringField("Name", validators=[DataRequired()])
    phnum = StringField("Phone Number", validators=[DataRequired(),
                                                    validators.Length(min=10, max=15),
                                                    validators.Regexp(regex=r'^\+?\d+$',
                                                                      message="Phone number must contain only digits")])
    submit = SubmitField("SIGN ME UP")


class CreateBlogForm(FlaskForm):
    title = StringField("Blog Post Title")
    subtitle = StringField("Subtitle")
    content = CKEditorField("Blog Content")
    submit = SubmitField("Submit Blog")
