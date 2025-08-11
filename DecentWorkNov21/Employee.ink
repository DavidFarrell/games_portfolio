=== EmployeeOpening ===
{student: -> BoOpening | ->LeeOpening}




=== LeeOpening ===
~ setBackground("bedroom")
~ placeCharacterInPoseWithAuraAt("Employee1", "Sleeping", "Sleepy", "InBed")
~ placePropAt("BlanketPartner", "Blanket")

______________
{employee_name}'s house - 5:47AM

The noise wakes {employee_name}, not the alarm for work, but the baby crying out.
    *It's {employee_name}'s turn <>
    ~ placeCharacterInPoseWithAuraAt("Employee1", "Idle", "None", "Left")
        to attend to the cries, even though that means no more sleep before they have to get ready for work.
    *It's {employee_name}'s partner's turn <>
        to attend to the cries, so {employee_name} tries to grab a few more precious moments of sleep before work.
-Almost immediately after the baby settles it's time to get up and drive to work.  

-> EmployeeAtStore

=== BoOpening ===
-> EmployeeAtStore

=== EmployeeAtStore ===

~ setBackground("outside")
~ placePropAt("BuildingGood", "Building")
~ placePropAt("EmployeeBadCar", "LeftParking")
~ placePropAt("ManagerNormalCar", "RightParking")

{student: {placeCharacterInPoseWithAuraAt("Student", "Idle", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "Cloud", "Left")} } 


{employee_name} hasn't been working at the store long but it's been going well so far.

~ setBackground("storeroom")
~ hideProp("EmployeeBadCar")
~ hideProp("ManagerNormalCar")
{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingBox", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingBox", "Cloud", "Left")} } 

It's been good working as part of a team again, and getting a break from the chaos at home.  
Having conversations with another adult that aren't just about "the kids" or even worse . . "money problems" has been great.

->EmployeeMakingSuggestion


=== EmployeeMakingSuggestion ===


{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "Cloud", "Left")} } 

As the weeks pass {employee_name} grows very familiar with the inner workings of the store.
{student: | With their knowledge of similar workplaces }feels comfortable enough to make a suggestion to the Manager.  
~ setBackground("breakroom")
~ placePropAt("ChairBad", "RChair")
~ placePropAt("TableBad", "Table")
~ placePropAt("Kettle", "CounterKettle")
~ placePropAt("MicrowaveBad", "CounterMicrowave")


{employee_name} feels that the employee breakroom is very underwhelming and could be improved
    *with some personal touches
        to make the place more pleasant.
        ~breakroom = "personality"
        ->ManagerBreakRoom
    *with better amenities
        , providing the staff with facilities for making snacks and lunch.
        ~breakroom = "amenities"
        ->ManagerBreakRoom
    - 
    ->EmployeeLateStart
    
    
=== EmployeeChildTrouble ===
~ setBackground("bedroom")
~ placeCharacterInPoseWithAuraAt("Employee1", "Idle", "Sleepy", "Left")
~ childTrouble = true
    With so much practice under their belt {employee_name} felt that getting the kids ready for school should be a lot smoother than it inevitably was.
    Today the problem was with
        *the youngest's shoes.
            She'd already outgrown them, and there was no room in this month's budget for new ones.
        *the eldest's sports gear.
            She wore them out so quickly that {employee_name} wished their daughter could have less physically strenuous hobbies.
    - The complaining, consoling, and expensive promises to replace things soon took time {employee_name} didn't have in the morning.  
->EmployeeLateStart2


=== EmployeeCarTrouble ===
~ setBackground("bedroom")
~ placeCharacterInPoseWithAuraAt("Employee1", "Idle", "Sleepy", "Left")
~ carTrouble = true
    The car had refused to start and there really was no public transport option to get to work. 
    Luckily  {student: one of their student roommates | a neighbour} came to the rescue

        *driving {employee_name} to work.
            {student: Their fellow students | The neighbours} had always been kind, but it was an unreliable source of transport.
            ~carAtWork = false
        *jumpstarting the engine.
            It clearly didn't have much longer to live though.
        -The car needed repaired, or replaced, but money was tight, {student: student loans didn't cover car breakdown costs} and the job didn't pay enough to just splash out on such things.
        
        
->EmployeeLateStart2

=== EmployeeStudyTrouble ===
~ studyTrouble = true
{student: {placeCharacterInPoseWithAuraAt("Student", "IdleFront", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "Idle", "Cloud", "Left")} } 
TODO setBackground and placeCharacter for the student
There was a test later that day.  Luckily {employee_name} had managed to get the early shift that finished before the test started.
It meant missing the group study session that was happening this morning, but they'd stayed up late studying instead.
Except their laptop seized up and by the time they'd fixed and got back to studying it was already past midnight.
Getting up this morning had been a real struggle for {employee_name}

->EmployeeLateStart2

=== EmployeeLateStart ===
~ setBackground("bedroom")

{student: {placeCharacterInPoseWithAuraAt("Student", "IdleFront", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "Idle", "Cloud", "Left")} } 

~ placePropAt("BlanketPartner", "Blanket")
~ placePropAt("MessyToys", "Toys")

Not long after Jo had {breakroomAmenities || breakroomDecorations: agreed to the suggestion | shot down the suggestion} {employee_name} was running late for work one morning.
    *There had been car trouble that morning.
        ->EmployeeCarTrouble
    *The kids had delayed {employee_name}.
        ->EmployeeChildTrouble
    *They had been studying
        ->EmployeeStudyTrouble


=== EmployeeLateStart2 ===
~ setBackground("outside")
~ placePropAt("BuildingGood", "Building")
{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "Cloud", "Left")} } 

{carAtWork:
    ~placePropAt("EmployeeBadCar", "LeftParking")
}


They had hoped to sneak into work late unnoticed but that was not to be. The 

    *Manager was arriving at the same time<> 
        {employee_name} did.
        ~ placePropAt("ManagerNormalCar", "RightParking")
        ~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "Sleepy", "Right")
        ~manager_late = true
    *Manager was covering the front till<> 
        ~ setBackground("storefront")
        ~ placeCharacterInPoseWithAuraAt("Manager1", "FrontDesk", "Cloud", "AtDesk")
        {student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "Cloud", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "Cloud", "Left")} } 
        ~ hideProp("EmployeeBadCar")
        for {employee_name}, no sneaking past that.
        ~ hideProp("EmployeeBadCar")
        


    -It hadn't even been {employee_name}'s fault they were late, not really.
    {childTrouble: There was no predicting children, and {employee_name} wasn't going to neglect their kids for the sake of being a few minutes late for work.}
    {carTrouble:The car had refused to start and there really was no public transport option to get to work. }
    {carTrouble:The car needed repaired, or replaced, but money was tight, and the job didn't pay enough to just splash out on such things.}
    {studyTrouble:{employee_name} didn't like letting people down, but their education had to get priority.  The Manager should understand that.}
    {employee_name} tried to explain why they were late
        *but Jo didn't want to hear any excuse.<> 
              Reprimanding them right in front of everyone for having a "bad attitude"
              ~publicReprimand = true
        *and Jo was sympathetic, but utimately unforgiving <>
            , giving them a stern, but thankfully quiet talk.
        -{employee_name} was placed on remedial duties, repetitive cleaning work on their own.
        ~ hideProp("EmployeeBadCar")
        ~ hideProp("ManagerNormalCar")
    ->EmployeeMenialDuty

=== EmployeeMenialDuty ===
~ setBackground("storeroom")
{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingBins", "None", "Right")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingBoxes", "None", "Right")} } 

~ placePropAt("BoxesBottle", "Boxes")


    Cleaning the storeroom was {employee_name}'s least favourite part of the job. And now they were on cleaning duty every day.
        *{employee_name} hated the solitude
            Working with the other staff and getting some social contact away from the stress at home was the best part of the job.
        *{employee_name} hated the repetitiveness
            Having to do the same unpacking and reorganising of the store every day was mind numbing.  And it never seemed to end, there was always more of the same waiting the next day.
~ placePropAt("BoxesBad", "Boxes2")
        -The worst part though, was that getting put on these duties didn't fix {employee_name}'s problem.
         {carTrouble:The car was still as likely to fail in the morning as ever}
         {childTrouble:The children were still going to need new things, and {employee_name} was always going to prioritise their kids.}
         
    -> EmployeeDecision2ndJobOrQuit

=== EmployeeDecision2ndJobOrQuit ===
~ setBackground("storeroom")

{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingBoxes", "None", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingBoxes", "None", "Left")} } 
~ placePropAt("Bins", "Bins")
{publicReprimand: {employee_name} didn't want to go through a telling off like that again. | {employee_name} would rather avoid awkward conversations like that.}
    *[quit]
        They wanted to quit and get a job where they could be treated better.  But figured they might as well look for jobs while getting paid for doing the absolute minimum each day at the SuperbMarket.
        ->END
    *[2nd Job]  
        {carTrouble: If they got a second job they could afford to fix up the car, and avoid nasty run ins with the manager for being late. }
        {childTrouble:If they got a second job they could afford to buy the kids some new things, and avoid nasty run ins with the manager for being late. }
        {studyTrouble: If they got a second job they could afford to buy a new laptop, and avoid nasty run ins with the manager for being late. }
        
        TODO give the student a bar job?
        There was a {student:bar |petrol station} near their {student:student flat |house} that was always looking for people to cover the late shift.

    ->EmployeeGarageOrBar
    *{manager_late == true}[<color=red>Get lazy</color>]
        It felt wrong to slack off at work, but the Manager had been just as late as {employee_name} and still gave them a hard time.  
        In {employee_name}'s opinion that was just bad management, and if the Manager wasn't going to do a good job, neither were they.
        ->END

=== EmployeeGarageOrBar ===
{student: ->EmployeeBarJob |->EmployeeGarageJob}




=== Employee2ndJob ===
~ showClutter(false)
~ setBackground("bedroom")

{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingBoxes", "Sleepy", "Right")}  |{placeCharacterInPoseWithAuraAt("Employee1", "Sleeping", "Sleepy", "InBed")} } 
~ 2ndJob = true
______________
{employee_name}'s house - 6:01AM
~ placePropAt("MessyToys", "Toys")
~ placePropAt("BlanketEmpty", "Blanket")
Sleeping through the alarm was tempting {!student: , but there was no sleeping through the baby crying. } 
The money from the night shift had helped with the car trouble, but {employee_name} was even more tired . . every day.
{student: ->Student2ndJobConsequences-> }
{!student: ->Parent2ndJobConsequences-> }

->ManagerYelpReview


=== Student2ndJobConsequences ===
It also meant
    *even less study time.<>
        Between work at the SuperbMarket and the night shift there was barely enough time to eat, nevermind hit the books.
    *less time to socialise.<>
        It might not seem important to their Manager, but {employee_name} was feeling increasingly isolated from their peers
        
    -Things were rough, but at least they got to work reliably.
->->

=== Parent2ndJobConsequences ===
It also meant
    *seeing less of the kids. <>
        There wasn't much a break between finishing at the store and heading back out to work at the garage. 
        And even the oldest was in bed before the garage shift ended.
    *seeing less of their partner<>
        , who also had been picking up a lot of the slack with looking after the kids. 
    -
->->

=== EmployeeBarJob ===
~setBackground("bar")
~placeCharacterInPoseWithAuraAt("Student", "bar", "Sleepy", "AtBar")


Working at the bar had seemed fun at first.  But it turned out
    *that {employee_name} liked going to bars
        with their friends more than they liked working at one.  Seeing their friends in the crowd having fun was a lonely sight.
    *that drunk customers were rude
        and they nmissed the quiet sober customers of the SuperbMarket.
-After the last customer left {employee_name} had to stay back and clean up before getting to go home and sleep.

->Employee2ndJob

=== EmployeeGarageJob ===
~ setBackground("petrolStation")
~ placeCharacterInPoseWithAuraAt("Employee1", "PetrolStation", "Sleepy", "Right")
{employee_name} was the only one working the late shift at the garage.
It was 
    *a lonely job
        compared to the SuperbMarket, with no coworkers to talk to.
    *a boring job
        compared to the SuperbMarket, with even less variety to help the hours pass.
-Some nights were so quiet that there was nothing to do, but the CCTV watched their booth as well as the courtyard so there was no 
        *catching a quick nap
            , which would have been very beneficial these days.
        *sneakily passing the time with a good book
            , so that the time away from their family wasn't wasted.
-{employee_name} found themselves watching the clock tick by, just wanting to be home.
->Employee2ndJob

=== EmployeeTiredAtWork ===
~ setBackground("storefront")

{student: {placeCharacterInPoseWithAuraAt("Student", "FrontDesk", "Sleepy", "AtDesk")}  |{placeCharacterInPoseWithAuraAt("Employee1", "FrontDesk", "Sleepy", "AtDesk")} } 

~ placePropAt("Customers", "Left")

    Working while this tired was tricky.  It didn't matter if people thought the job was easy.
    {employee_name} struggled to get everything done on time and correctly without a good nights sleep.
    Today's todo list seemed to stretch out in front of them.

->EmployeeAccident


=== EmployeeAccident ===
~ setBackground("storefront")
    *Collect the week's receipts and file for Jo to verify later.
        {student: {placeCharacterInPoseWithAuraAt("Student", "FrontDesk", "Sleepy", "AtDesk")}  |{placeCharacterInPoseWithAuraAt("Employee1", "FrontDesk", "Sleepy", "AtDesk")} } 
        -> AccidentLoopNode
    *Check for out of date produce and apply the discount stickers
        {student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "Sleepy", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "Sleepy", "Left")} } 
        -> AccidentLoopNode
    *Remove last month's Special Offers from the window and put the new display up.
        {student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "Sleepy", "Right")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "Sleepy", "Right")} } 
        -> AccidentLoopNode
    *Clean up the spillage on ailse 3
        {student: {placeCharacterInPoseWithAuraAt("Student", "WorkingBins", "Sleepy", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingBox", "Sleepy", "Left")} } 
        
        -> AccidentLoopNode
    *{EmployeeAccident > 2} Restack the expensive drinks on the top shelf of aisle 5
        {student: {placeCharacterInPoseWithAuraAt("Student", "WorkingBoxes", "Sleepy", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingBoxes", "Sleepy", "Left")} } 
        {employee_name} looked at the remaining bottles and decided they could just manage it in one more trip up the step ladder.
        -As they climbed the ladder, arms full of bottles 
            **Concentration wavered and {employee_name} slipped<> 
            and fell to the ground with a crash, and a sickening
                ***SNAP
        
          
    ->ManagerAccident

=== AccidentLoopNode ===
-> EmployeeAccident

=== EmployeeSuggestionsAfterImprovements ===
~ setBackground("storefront")

{student: {placeCharacterInPoseWithAuraAt("Student", "FrontDesk", "None", "AtDesk")}  |{placeCharacterInPoseWithAuraAt("Employee1", "FrontDesk", "None", "AtDesk")} } 
    With new found motivation {employee_name} began to notice ways to make their job easier and more efficeint for the store.
        *A new shift signup system
            should help everone be more flexible with when they work.
            while also avoiding people getting stuck with shifts they don't like all the time.
            ~ newShiftSystem = true
        *Automated tracking of out of date stock
            would help the SuperbMarket better manage orders to meet the actual demand 
            ~ stockTracking = true
        -The ideas were all taken on board by Jo, who was listening a lot more closely since the accident.
->EmployeeGreaterResponsibilty

=== EmployeeGreaterResponsibilty ===

The new system had been adopted and Jo was openly crediting {employee_name} for the idea.
It was gratifying
    *to be recognised for their ideas.
        Previous jobs had all too frequently had managers willing to take all the credit.
    *to know that their idea had worked.
        They were the one doing the job every day, it was only right that they'd know best how to improve it.
-To {employee_name}'s surprise it went beyond Employee of the Month recognition, and Jo gave them a small promotion.
->EmployeeSmallPromotion

===EmployeeSmallPromotion ===
~ setBackground("outside")
~ placePropAt("BuildingGood", "Building")
~ placePropAt("EmployeeBadCar", "LeftParking")
~ placePropAt("ManagerNormalCar", "RightParking")
    The extra responsibilty and promotion had come with a small pay increase for {employee_name}
    It wasn't going to change their world, but it did allow some long standing problems to finally be addressed.

    ->EmployeeEpilogueCar

    
=== EmployeeEpilogueCar ===
    The old car that {employee_name} had been driving was finally replaced with
        *a shiny, barely used, red car
            ~ hideProp("EmployeeBadCar")
            ~ placePropAt("EmployeeGoodCar", "LeftParking")
        *a shiny, barely used, blue car
            ~ hideProp("EmployeeBadCar")
            ~ placePropAt("EmployeeGoodCar", "LeftParking")
        -No longer did they have to worry about car trouble stopping them from getting to work.
        Or preventing them from being able to reliably visit anywhere.
    {student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "None", "Left")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "None", "Left")} } 
->END

=== EmployeeEpilogueChildren ===
    They had splashed out on updating all the essentials for the kids, for once not relying on hand me downs from the older siblings to fill the gaps.
    
->END

=== EmployeeBreakup ===
Either have the scene or just refer to it
->FAKEEND



=== LeeCV ===
    ~ displayCV("Lee")
    They are experienced
     ~ displayCV("None")
    ->->
    
=== BoCV ===
    ~ displayCV("Bo")
    They are a student
    ~ displayCV("None")
    ->->