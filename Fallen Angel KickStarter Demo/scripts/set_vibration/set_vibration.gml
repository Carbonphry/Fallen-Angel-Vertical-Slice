/// @description set_vibration(leftMotor,rightMotor,segs)
/// @param leftMotor
/// @param rightMotor
/// @param segs
gml_pragma("forceinline");
if global.gamepad_active == false then exit;

if (global.vibration) {
   gamepad_set_vibration(global.pad[0],0+argument0,0+argument1);
   o_input.alarm[1] = room_speed*(0+argument2);
}
