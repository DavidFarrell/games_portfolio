INCLUDE Manager.ink
INCLUDE Employee.ink
INCLUDE Student.ink



EXTERNAL setBackground(backgroundName)
EXTERNAL setReason(reasonString)
EXTERNAL displayOverlay(overlayName)
EXTERNAL displayCV(employeeName)
EXTERNAL showClutter(clutterBool)
EXTERNAL placeCharacterInPoseWithAuraAt(character, pose, aura, location)
EXTERNAL hideCharacter(character)
EXTERNAL placePropAt(prop, location)
EXTERNAL hideProp(prop)

VAR employee_name = "Employee"
VAR student = true
VAR employee_stress = 0 
VAR employee_motivation = 0
VAR employee_salary = 0
VAR employee_anger = 0

VAR breakroom = ""
VAR breakroomAmenities = false
VAR breakroomDecorations = false
VAR carAtWork = true
VAR 2ndJob = false
VAR stockTracking = false
VAR newShiftSystem = false
VAR carTrouble = false
VAR studyTrouble = false
VAR childTrouble = false
VAR publicReprimand = false

VAR minimumWage = false
VAR experience = false
VAR flexible = false
VAR companyMan = false
VAR teamPlayer = false

VAR manager_type = ""
VAR manager_late = false
VAR manager_dismissive = 0 
VAR manager_caring = 0 


~ setBackground("storefront")

-> ManagerOpening


=== FAKEEND ===
    Temporary knot to send other knots to until I have them in the correct flow
->END


//Fallback functions for making Ink preview work    
=== function setBackground(backgroundName) ===
    ~ return "Name" 
    
    
=== function setReason(reasonString) ===
    ~ return "string" 

=== function displayOverlay(overlayName) ===
    ~ return "string" 

=== function displayCV(employeeName) ===
    ~ return "string" 
    
=== function showClutter(ClutterBool) ===
    ~ return true
    
    
=== function placeCharacterInPoseWithAuraAt(character, pose, aura, location) ===
    ~ return "string" 
    
=== function hideCharacter(character) ===
    ~ return "string" 

=== function placePropAt(prop, location) ===
    ~ return "string" 
    
=== function hideProp(prop) ===
    ~ return "string" 