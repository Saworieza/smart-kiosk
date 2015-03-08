require 'opentok'

$opentok = OpenTok::OpenTok.new '45174522', '3cd9f6d609ce4c45b44ecc68d7aefa7d414310b1'
session = $opentok.create_session
$session_id = session.session_id
$token = $opentok.generate_token($session_id)
