=== ManagerOpening ===
~ setBackground("managerBedroom")
~ placeCharacterInPoseWithAuraAt("Manager1", "Sleeping", "Sleepy", "InBed")



Jo wakes up ready for another day managing the store.  
Even though the managerial role isn't customer facing that often, it's important to Jo to lead by example and dress appropriately for work.
    * [Wear the purple hat]
        The hat was a gift from Jo's mum when they graduated from Business School.
    * [Wear the green earrings]
        They had belonged to Jo's grandmother, who had arrived in the country with nothing and always provided for her family.  Jo had inherited them recently.
    
    -   It had been their favourite ever since.  
    
    ~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "None", "Left")

        
    * [Drive to work]
        Jo gets in their car and drives to work.  It's only a couple of years old, but maybe it's time to upgrade soon.  So long as the replacement was still red.    
    
    - 
    ~ setBackground("outside")
    ~ placePropAt("BuildingGood", "Building")
    
    - Jo had been managing this branch of the SuperbMarket for around a year now.  
    ~ placePropAt("ManagerNormalCar", "RightParking")
    It was going well, but there was increasing pressure from the owner to increase profits.
    ~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "Cloudy", "Right")
    There was a vacancy at the store and Jo thought there should be some suitable CVs from the recruitment agency waiting on their desk today.
    -> ManagerOfficeIntro
    
=== ManagerOfficeIntro ===
~ setBackground("office")
~ hideProp("ManagerNormalCar")
~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "None", "Right")
    The store has a small office in the back where Jo gets most of their work done.  Juggling shift schedules, dealing with suppliers, keepping the staff motivated.
        *The front staff don't appreciate Jo<> 
             and how much work it takes to keep things running smoothly.  
             And how lucky they are that Jo insulates them from the pressure from above that the owner lays on. 
        *No one interrupts Jo<> 
            when they are hard at work back there.
        - Jo prepares their morning
            *tea<>
                , dunking a teabag into the mug of water a few times, before adding a splash of milk and too many sugars.
            *coffee<>
                , the pod sliding into the machine with a satisfying <bold>thunk</bold> before trickling out a perfect morning espresso.
        - Fortified and ready to face the day, Jo contemplates the task at hand.
  
    ~ placeCharacterInPoseWithAuraAt("Manager1", "OfficeDesk", "None", "AtDesk")
    
    There is an open position for an entry level job.
    -> JobSpec ->
    As Jo is considering the Job Spec a text arrives from the owner of the store.
    -> ManagerOwnerRecruitmentTalk
    
=== JobSpec ===
    The previous holder of the position had left
        *with the minimum of notice, and no explanation.
        *for a job at another chain that paid slightly more
         but was in a much worse neighbourhood.
    - 
    PLACEHOLDER: DISPLAY JOB SPEC HERE
    ->->
    
=== ManagerOwnerRecruitmentTalk ===
    STAGEDIRECTION: This will be a phone message conversation. For getting some of the Reward and Recognition points into the game.
    BOSS: HAVE YOU FILLED THAT VACANCY YET. I DONT WANT MY STORES GETTING MORE COMPLAINTS
    JO: I'm looking at the CVs of the applicants today.
    BOSS: CHOOSE WISELY - I EXPECT IMPROVED RESULTS FROM YOU THIS QUARTER
        *JO: It's an entry level job, so we could offer minimum wage
            BOSS: JUST SO LONG AS THEY DO A GOOD JOB 
            ~ minimumWage = true
        *JO: An experienced hire should be more efficient at the job<>
            , if we can make them feel valued
            BOSS: YOULL HAVE TO MAKE ROOM IN YOUR BUDGET FOR THAT!
            ~ experience = true
        *JO: If we emphasise the flexible shifts it should help motivate the new hire
            BOSS: IF YOU LET THEM CHOOSE WHEN THEY START NO ONE EVER WANTS THE EARLY SHIFT 
            ~ flexible = true
        *JO: We want someone who will stick with the company for the long term.
            BOSS: MAKE SURE THEY DONT TOO COMFORTABLE    
            ~ companyMan = true
        *JO: We’re looking for a team player<> 
            ,someone that will do the job well, but also improve the team.
            BOSS: JUST MAKE SURE THEY REMEMBER YOU ARE IN CHARGE
            ~ teamPlayer = true

        -BOSS: I'M LEAVING THE FINAL DECISION TO YOU
    -> ManagerCV
    

    
    
=== ManagerCV ===
~ setBackground("office")
~ placeCharacterInPoseWithAuraAt("Manager1", "OfficeDesk", "None", "AtDesk")
    Immediately after the conversation with the owner, Jo contemplates the two CVs for the open position.
        ->ManagerLookAtCV->
        After some consideration Jo decides to hire
            *Lee 
                ~ employee_name = "Lee"
                ~ student = false
            *Bo 
                ~ employee_name = "Bo"
                ~ student = true
        -{minimumWage && employee_name == "Lee": Even though Lee's experience meant they might not accept a minimum wage job.}
        {minimumWage && employee_name == "Bo": As Bo was under 25 they could get away with paying less.}
        {experience && employee_name == "Lee": Their CV had shown a range of experience in similar roles that should prove useful.}
        {experience && employee_name == "Bo": Hopefully their youthful enthusiasm would make up for the lack of experience.}
        {flexible && employee_name == "Lee": If Lee had a family they should appreciate the flexible shifts on offer at the SuperbMarket.}
        {flexible && employee_name == "Bo": The student lifestyle of Bo should work well with variable shifts at the SuperbMarket.}
        {companyMan && employee_name == "Lee": Lee had stuck at previous roles for a while, which suggested they were a good company focussed employee.}
        {companyMan && employee_name == "Bo": Bo was unlikely to want to commit to the SuperbMarket franchise for life, but there was value in shaping a young mind.}
        {teamPlayer && employee_name == "Lee": Leadership roles in Lee's past suggested they were a good team player.}
        {teamPlayer && employee_name == "Bo": Students were always socialable types that liked to work as part of a team.}
        
        Jo instructed the recruiter to make an offer with an immediate start date.
        
        
    -> EmployeeOpening
    
=== ManagerStockEfficiency ===
Should take into account Employee and manager attitudes.
->EmployeeLateStart

=== ManagerBreakRoom ===
~ setBackground("breakroom")
~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "Cloud", "Left")

{student: {placeCharacterInPoseWithAuraAt("Student", "WorkingEmpty", "None", "Right")}  |{placeCharacterInPoseWithAuraAt("Employee1", "WorkingEmpty", "None", "Right")} } 

    {breakroom == "amenities": -> ManagerBreakRoomAmenities ->}
    {breakroom == "personality" : -> ManagerBreakRoomPersonality ->}
    ->EmployeeLateStart
        
=== ManagerBreakRoomAmenities ===
    Jo thought there were more important things to take care of,
        * an old microwave is more than enough<> 
            to keep them quiet
        *  but letting them choose some things to add<> 
            should help morale for a minimal cost
            ~ breakroomAmenities = true
        - 
->->

=== ManagerBreakRoomPersonality ===
    Jo doesn't spend any time in the break room themselves, 
        *but allowing the staff to add personal touches<> 
            won't harm anything.  
            ~ breakroomDecorations = true
        *and the staff shouldn't be in there long enough<> 
            to care about the decor either.
        -
->->
    
=== ManagerLookAtCV ===
    +[Look at Lee's CV]
        ->LeeCV->
        ->ManagerLookAtCV
    +[Look at Bo's CV]
        ->BoCV->
        ->ManagerLookAtCV
    *{LeeCV || BoCV } [<color="blue">Time to decide</color>]
        It's time to decide.  
        ->->
        
        
=== ManagerYelpReview ===
~ setBackground("office")
~ placeCharacterInPoseWithAuraAt("Manager1", "OfficeDesk", "Cloudy", "AtDesk")
    As Jo sat down in the office they noticed an unread text from the owner.
    ->OwnerAngryYelpText->
    Alarmed Jo booted up the computer to see what the owner was angry about
    PLACEHOLDER: DISPLAY OVERLAY OF BAD ONLINE REVIEWS AT THIS POINT
    This didn't look good . . .
        *Jo knew there had been problems with staff motivation
            but hadn't thought things had gotten this noticeable.
        *Jo had started to regret hiring {employee_name}
            But hadn't thought the customers would have noticed the consequences of the bad hiring decision.
        -before Jo could do anything more angry messages arrived.
        -> OwnerAngryYelpText2->
    Something would have to be done. 
    And soon.
    ->EmployeeTiredAtWork
    
=== YelpSite ===
    This will probably just be on the image, but for WIP can store here
    Terrible Service!
    Shelves were very untidy and staff didn't seem to care!
    Used to be a good local store has gone downhill since it got bought out
    
    
    ->END
    
    
=== OwnerAngryYelpText ===

    BOSS: HAVE YOU SEEN THE WHAT THEY ARE SAYING ABOUT _MY_ STORE. WHAT DO I PAY YOU FOR?!
    ->->

=== OwnerAngryYelpText2 ===

    BOSS: SO 
    BOSS: WHAT'RE GOING TO DO ABOUT IT
        *JO: I didn't know about the reviews until your message 
            JO: I'm looking into it now and will make sure we deal with the problem.
        *JO: I was already working on a solution when I got your text this morning
            JO: The solution is already underway and I'll have an update for you shortly.
        - . . . . 
    BOSS: WHAT IS THE PROBLEM?
        *JO: It's all that new hire {employee_name}'s fault
        *JO: I've overheard the staff complaining that they work too hard for not enough reward.
            JO: we shouldn't be surprised that this impacts the quality of their work.
    -. . .     
    
    ->->

=== ManagerAccident ===
~ setBackground("outside")
~ placePropAt("BuildingBad", "Building")
~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "None", "Left")
~ placePropAt("ManagerNormalCar", "RightParking")
~ placePropAt("EmployeeBadCar", "LeftParking")
    The ambulance came to take {employee_name} to the hospital.  As it was was about to drive away the first thought that poppped into Jo's head was 
        *if {employee_name} was going to be ok
            They would definitely need some time off to recover.
        *how they would fill the gap in the shift schedule <>
            with {employee_name} out of commission
            It wasn't convenient to hire a new worker to fill the gap.
        -There would have to be some changes to the health and safety procedure at the store.
        
    ~ hideProp("ManagerNormalCar")
    ~ hideProp("EmployeeBadCar")
    -> ManagerBossSafetyTalk ->
    
    ->ManagerChasingInjuredEmployee
    
    
=== ManagerBossSafetyTalk ===
~ setBackground("office")
~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "None", "Left") 
    STAGEDIRECTION: This is another phone text conversation
    BOSS: CAN WE PROVE IT WAS NOT OUR FAULT
        *JO: I had no idea {employee_name} was that clumsy
            BOSS: DID THE SHOP CAMERA CATCH {employee_name} BEING CLUMSY
            JO: I don't think so
        *JO: I knew that {employee_name} had another job and still had them on the early shift
            BOSS: DONT TELL ME THAT
        *JO: {employee_name} shouldn't have climbed the ladder carrying so much
            BOSS: DID OUR TRAINING COVER THAT?
            JO: It's not explicit in the current onboarding process, but employees shouldn't carry more than they can handle.
            BOSS: GET IT IN WRITING
    -BOSS: DONT LET THIS HAPPEN AGAIN 
    ->->
        
   
=== ManagerChasingInjuredEmployee ===
~ setBackground("storefront")
~ placeCharacterInPoseWithAuraAt("Manager1", "FrontDesk", "None", "AtDesk")
~ placePropAt("Customers", "Left")
    Jo had been pulling double duties since {employee_name} injured themselves on the job a few weeks ago.
    Having the accident happen on their watch had made Jo reconsider how things were done at the SuperbMarket. 
    According to the original Doctor's note prediction {employee_name} could have been back at work by now.
    Jo decided to  
        *Message {employee_name} to see when they can come back to work
        *Message {employee_name} to see how they are recovering 
        -There would have to be changes when {employee_name} returns, to help prevent this sort of accident happening again.
        
    ->EmployeeBackAtWork


=== EmployeeBackAtWork ===
~ setBackground("storefront")
~ placeCharacterInPoseWithAuraAt("Manager1", "Idle", "None", "Left")
{student: {placeCharacterInPoseWithAuraAt("Student", "FrontDesk", "None", "AtDesk")}  |{placeCharacterInPoseWithAuraAt("Employee1", "FrontDesk", "None", "AtDesk")} } 
    With {employee_name} starting back this week Jo had ensured the new policies were in place.
    Hopefully these would help reduce incidents like before.
    STAGEDIRECTION: Add a couple more options here and slow down pace of epilogue 
    *Employee Salary Increase
        With the increase up to the National Living Wage some of the financial pressure should be off the employees.
        Hopefully this will mean an end to the employees feeling the need to work multiple jobs.
    
->ImprovementsToConditions

=== ImprovementsToConditions ===
~ setBackground("storefront")
{student: {placeCharacterInPoseWithAuraAt("Student", "FrontDesk", "None", "AtDesk")}  |{placeCharacterInPoseWithAuraAt("Employee1", "FrontDesk", "None", "AtDesk")} } 
    
->EmployeeSuggestionsAfterImprovements



    


