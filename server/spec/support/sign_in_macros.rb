module SignInMacros
  def sign_in(user)
    post api_v1_user_session_path, params: {
      email: user.email,
      password: user.password
    }
    return response
  end
end