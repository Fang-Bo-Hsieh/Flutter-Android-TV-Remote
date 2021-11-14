<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

const KEYMAPPING = [
	'KEYCODE_MENU' => 1,
	'KEYCODE_HOME' => 3,
	'KEYCODE_BACK' => 4,
	'KEYCODE_POWER' => 26,
	'KEYCODE_ALL_APPS' => 284,
	'KEYCODE_DPAD_LEFT' => 21,
	'KEYCODE_DPAD_RIGHT' => 22,
	'KEYCODE_DPAD_UP' => 19,
	'KEYCODE_DPAD_DOWN' => 20,
	'KEYCODE_DPAD_CENTER' => 23,
	'KEYCODE_VOLUME_DOWN' => 25,
	'KEYCODE_VOLUME_UP' => 24,
	'KEYCODE_VOLUME_MUT' => 164,
	'KEYCODE_CHANNEL_DOWN' => 167,
	'KEYCODE_CHANNEL_UP' => 166,
];

function connectToAdb($ip) {
	$shell = 'adb connect ' . escapeshellarg($ip);

    shell_exec($shell);
}

function sendKeyWithAdb($key) {

    if (!isset(KEYMAPPING[$key])) {
    	return;
    }

    $shell = 'adb shell input keyevent ' . escapeshellarg($key);

    shell_exec($shell);
}
  
// get posted data
$data = json_decode(file_get_contents("php://input"), true);
error_log('$data :: ' . json_encode($data));

if (isset($data['ip'])) {
	connectToAdb($data['ip']);
}

if (isset($data['key'])) {
	sendKeyWithAdb($data['key']);
}
  
// set response code - 201 created
// http_response_code(201);

// tell the user
echo json_encode(array("status" => 1));
  
?>
