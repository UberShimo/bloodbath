// Totally copy pasted from internet :3

function input_to_string(input){
	// inputboard
	// Letters A-Z (ord("A")=65 through ord("Z")=90)
    if (input >= ord("A") && input <= ord("Z")) return string_upper(chr(input));
    // Digits 0-9
    if (input >= ord("0") && input <= ord("9")) return string(input - ord("0"));
    // Numpad
    if (input >= vk_numpad0 && input <= vk_numpad9) return "Num " + string(input - vk_numpad0);
    // Function inputs
    if (input >= vk_f1 && input <= vk_f12) return "F" + string(input - vk_f1 + 1);

    // Special inputs — manual lookup
    switch (input) {
        case vk_left:      return "Left";
        case vk_right:     return "Right";
        case vk_up:        return "Up";
        case vk_down:      return "Down";
        case vk_enter:     return "Enter";
        case vk_space:     return "Space";
        case vk_escape:    return "Escape";
        case vk_tab:       return "Tab";
        case vk_backspace: return "Backspace";
        case vk_delete:    return "Delete";
        case vk_insert:    return "Insert";
        case vk_home:      return "Home";
        case vk_end:       return "End";
        case vk_pageup:    return "Page Up";
        case vk_pagedown:  return "Page Down";
        case vk_shift:     return "Shift";
        case vk_control:   return "Ctrl";
        case vk_alt:       return "Alt";
        default:           // Continue to controller checking
    }
	
	// Controller
    switch (input) {
        // Face buttons (Xbox naming)
        case gp_face1:      return "(A)";
        case gp_face2:      return "(B)";
        case gp_face3:      return "(X)";
        case gp_face4:      return "(Y)";

        // Shoulders & triggers
        case gp_shoulderl:   return "[LB]";
        case gp_shoulderlb:  return "[LT]";
        case gp_shoulderr:   return "[RB]";
        case gp_shoulderrb:  return "[RT]";

        // System buttons
        case gp_select:      return "[Select]";
        case gp_start:       return "[Start>";

        // Sticks (as buttons)
        case gp_stickl:      return "(L3)";
        case gp_stickr:      return "(R3)";

        // D-pad
        case gp_padu:        return "Pad Up";
        case gp_padd:        return "Pad Down";
        case gp_padl:        return "Pad Left";
        case gp_padr:        return "Pad Right";

        // Analog axes
        case gp_axislh:      return "Left Stick H";
        case gp_axislv:      return "Left Stick V";
        case gp_axisrh:      return "Right Stick H";
        case gp_axisrv:      return "Right Stick V";

        default:             return ""; // Input lead to nothing...
    }
}