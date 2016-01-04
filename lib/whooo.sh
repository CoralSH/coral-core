main() {
  require "./config"
  token="$(config get "auth_token")"

  curl --data "token=$token" http://localhost:8000/auth/whoami
}
