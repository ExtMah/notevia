class Links {
  static const String baseUrl = 'https://notevia.ebabakg.ir/veiw/';

  Uri register = Uri.parse("https://notevia.ebabakg.ir/veiw/register.php");
  Uri login = Uri.parse("https://notevia.ebabakg.ir/veiw/login.php");

  static Uri forgetPassword =
      Uri.parse("https://notevia.ebabakg.ir/veiw/forgot.php");

  Uri resetPassword = Uri.parse("https://notevia.ebabakg.ir/veiw/reset.php");
  static const String categories = "categories.php";

  Uri verifier = Uri.parse('https://notevia.ebabakg.ir/veiw/verifier.php');
}
