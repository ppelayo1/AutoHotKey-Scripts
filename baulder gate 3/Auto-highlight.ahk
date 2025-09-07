#Persistent
#SingleInstance Force

; Variable to track toggle state
isAltHeld := false

; When Alt is pressed, toggle holding it down
~Alt::
if (!isAltHeld) {
    isAltHeld := true
    Send, {Alt down}
} else {
    isAltHeld := false
    Send, {Alt up}
}
return
