
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-with-who ""
	 (start)
    =>	
    (assert (UI-state (display "Who are you watching it with?")
                     (relation-asserted with-who)
                     (response "My main squeeze" )
                     (valid-answers "My main squeeze" "My girlfriends" "My family"))))

(defrule determine-care-if-he-enjoys ""
		(with-who My main squeeze)
    =>

    (assert (UI-state (display "Do you care if he enjoys it?")
                     (relation-asserted answer-care-if-he-enjoys)
                     (response No )
                     (valid-answers Yes No)))) 

(defrule determine-morals ""
		(with-who Comedy)
    =>

    (assert (UI-state (display QuestionableMoralsQuestion)
                     (relation-asserted morals)
                     (response No )
                     (valid-answers Yes No)))) 	


(defrule determine-place ""
		(with-who Both)
    =>

    (assert (UI-state (display TownOrPrisonQuestion)
                     (relation-asserted place)
                     (response Prison )
                     (valid-answers Small-Town Prison)))) 

(defrule determine-action-packed-or-thought-provoiking ""
		(answer-care-if-he-enjoys Yes)
    =>

    (assert (UI-state (display "Action packed or thought provoiking")
                     (relation-asserted answer-action-packed-or-thought-provoiking)
                     (response "I love explosions!" )
                     (valid-answers "I love explosions!" "Brains and beauty" "Lets stick to the com in romcom")))) 	
					 
(defrule determine-judd-apatow-film ""
		(answer-action-packed-or-thought-provoiking Lets stick to the com in romcom)
    =>

    (assert (UI-state (display "Judd apatow film?")
                     (relation-asserted answer-judd-apatow-film)
                     (response "Yes please" )
                     (valid-answers "Yes please" "Pass")))) 	


(defrule determine-guys-only ""
		(answer-judd-apatow-film Pass)
    =>

    (assert (UI-state (display "Guys only?")
                     (relation-asserted answer-guys-only)
                     (response "Bromance is the best" )
                     (valid-answers "Bromance is the best" "Girl power")))) 


(defrule determine-girl-in-love ""
		(answer-guys-only Girl power)
    =>

    (assert (UI-state (display "Is the girl in love?")
                     (relation-asserted answer-girl-in-love)
                     (response "She is smitten" )
                     (valid-answers "She is smitten" "She may be a little unaware")))) 


(defrule determine-like-jamaican-accents ""
		(answer-guys-only Bromance is the best)
    =>

    (assert (UI-state (display "Do you like fake jamaican accents?")
                     (relation-asserted answer-like-jamaican-accents)
                     (response "Ya man" )
                     (valid-answers "Ya man" No)))) 


(defrule determine-thinking-of-marrige ""
		(answer-judd-apatow-film Yes please)
    =>

    (assert (UI-state (display "Thinking of marrige?")
                     (relation-asserted answer-thinking-of-marraige)
                     (response "Yes" )
                     (valid-answers "Yes" "Nah")))) 	


(defrule determine-broken-or-knocked ""
		(answer-thinking-of-marraige Nah)
    =>

    (assert (UI-state (display "Broken up or knocked up?")
                     (relation-asserted answer-broken-or-knocked)
                     (response "There is humor in sorrow" )
                     (valid-answers "There is humor in sorrow" "I see where this is headed")))) 


(defrule determine-strongfemale ""
		(morals No)
    =>

    (assert (UI-state (display StrongFemaleQuestion)
                     (relation-asserted strongfemale)
                     (response No )
                     (valid-answers Yes No)))) 	

(defrule determine-people ""
		(morals Yes)
    =>

    (assert (UI-state (display FriendOrFamilyQuestion)
                     (relation-asserted people)
                     (response Friend )
                     (valid-answers Friend Family)))) 

(defrule determine-cry ""
		(politics No)
    =>

    (assert (UI-state (display CryingQuestion)
                     (relation-asserted cry)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-action ""
		(politics No)
    =>

    (assert (UI-state (display ActionQuestion)
                     (relation-asserted action)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-military-fan ""
		(answer-action-packed-or-thought-provoiking I love explosions!)
    =>

    (assert (UI-state (display "Military fan?")
                     (relation-asserted answer-military-fan)
                     (response "About face" )
                     (valid-answers "About face" No)))) 

(defrule determine-starring-an-it-girl ""
		(answer-action-packed-or-thought-provoiking Brains and beauty)
    =>

    (assert (UI-state (display "Starring an it girl")
                     (relation-asserted answer-starring-an-it-girl)
                     (response Yes )
                     (valid-answers Yes No)))) 

(defrule determine-foreign-film ""
		(answer-starring-an-it-girl No)
    =>

    (assert (UI-state (display "Foreign film?")
                     (relation-asserted answer-foreign-film)
                     (response Oui )
                     (valid-answers Oui No)))) 
					 
(defrule determine-romance ""
		(action No)
    =>

    (assert (UI-state (display RomanceQuestion)
                     (relation-asserted romance)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-drugs ""
		(strongfemale Yes)
    =>

    (assert (UI-state (display DrugsQuestion)
                     (relation-asserted drugs)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-work ""
		(strongfemale No)
    =>

    (assert (UI-state (display WorkPlaceQuestion)
                     (relation-asserted work)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-football ""
		(cry Yes)
    =>

    (assert (UI-state (display FootballQuestion)
                     (relation-asserted football)
                     (response No )
                     (valid-answers Yes No)))) 
					 
					 
(defrule determine-crime ""
		(cry No)
    =>

    (assert (UI-state (display CrimeQuestion)
                     (relation-asserted crime)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
					 
(defrule determine-ladies ""
		(drugs No)
    =>

    (assert (UI-state (display TinaOrAmyQuestion)
                     (relation-asserted ladies)
                     (response Tina )
                     (valid-answers Tina Amy)))) 
					 
					 
(defrule determine-gentlemen ""
		(work No)
    =>

    (assert (UI-state (display WantToSeeQuestion)
                     (relation-asserted gentlemen)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-barorcafe ""
		(gentlemen No)
    =>

    (assert (UI-state (display BarOrCafeQuestion)
                     (relation-asserted barorcafe)
                     (response Bar )
                     (valid-answers Cafe Bar)))) 
					 
					 
(defrule determine-hospitals ""
		(football No)
    =>

    (assert (UI-state (display HospitalsQuestion)
                     (relation-asserted hospitals)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-meth ""
		(crime No)
    =>

    (assert (UI-state (display MethQuestion)
                     (relation-asserted meth)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
(defrule determine-criminals ""
		(crime Yes)
    =>

    (assert (UI-state (display CriminalsQuestion)
                     (relation-asserted criminals)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
					 
(defrule determine-oorc ""
		(romance No)
    =>

    (assert (UI-state (display CriminalsQuestion)
                     (relation-asserted oorc)
                     (response Optimistic )
                     (valid-answers Optimistic Cynical)))) 
					 
(defrule determine-vampires ""
		(romance No)
    =>

    (assert (UI-state (display VampiresQuestion)
                     (relation-asserted vampires)
                     (response No )
                     (valid-answers Yes No)))) 
					 
(defrule determine-tear-jerker ""
		(answer-foreign-film No)
    =>

    (assert (UI-state (display "Tear Jerker")
                     (relation-asserted answer-tear-jerker)
                     (response "Prefer to laugh" )
                     (valid-answers "I am not crying" "Prefer to laugh")))) 
					 
(defrule determine-like-beer ""
		(answer-tear-jerker Prefer to laugh)
    =>

    (assert (UI-state (display "Do you like beer")
                     (relation-asserted answer-like-beer)
                     (response No )
                     (valid-answers No "Yummy")))) 


(defrule determine-like-adam-sandler ""
		(answer-like-beer No)
    =>

    (assert (UI-state (display "Do you like Adam Sandler")
                     (relation-asserted answer-like-adam-sandler)
                     (response Pass )
                     (valid-answers Pass "Of course")))) 

(defrule determine-good-or-bad-girl ""
		(answer-like-adam-sandler Pass)
    =>

    (assert (UI-state (display "Good or bad girl")
                     (relation-asserted answer-good-or-bad-girl)
                     (response "This one time" )
                     (valid-answers "This one time" "Nice girls never get the guy")))) 


(defrule determine-sandler ""
		(answer-like-adam-sandler Of course)
    =>

    (assert (UI-state (display "90s sandler or 2000s sandler")
                     (relation-asserted answer-sandler)
                     (response "Classic Adam" )
                     (valid-answers "Classic Adam" "New")))) 


(defrule determine-forp ""
		(romance No)
    =>

    (assert (UI-state (display VampiresQuestion)
                     (relation-asserted forp)
                     (response Forensics )
                     (valid-answers Forensics Psychology)))) 


(defrule determine-male-or-female-lead ""
	(answer-military-fan No)
     =>

    (assert (UI-state (display "Male or female lead?")
                     (relation-asserted answer-male-or-female-lead)
                     (response "Male" )
                     (valid-answers "Girls have muscle, too!" "Male")))) 
					 
;;; ***************************
;;; *  FINAL  *  CONCLUSIONS  *
;;; *************************** 

(defrule wedding-crashers ""
	(answer-girl-in-love She is smitten)
	=>
	
	(assert (UI-state (display "Wedding Crashers")
					  (state final)
					  )))

(defrule there-is-something0about-marry ""
	(answer-girl-in-love She may be a little unaware)
	=>
	
	(assert (UI-state (display "There is something about Mary")
					  (state final)
					  )))

(defrule love-you-man ""
	(answer-like-jamaican-accents Ya man)
	=>
	
	(assert (UI-state (display "I love you, man!")
					  (state final)
					  )))

(defrule don-jon ""
	(answer-like-jamaican-accents No)
	=>
	
	(assert (UI-state (display "Don Jon")
					  (state final)
					  )))

(defrule forgetting-sarah-marshall ""
	(answer-broken-or-knocked There is humor in sorrow)
	=>
	
	(assert (UI-state (display "Forgetting Sarah Marshall")
					  (state final)
					  )))


(defrule knocked-up ""
	(answer-broken-or-knocked I see where this is headed)
	=>
	
	(assert (UI-state (display "Knocked up")
					  (state final)
					  )))


(defrule this-is-40 ""
	(answer-thinking-of-marraige Yes)
	=>
	
	(assert (UI-state (display "This is 40")
					  (state final)
					  )))

(defrule wedding-singer ""
	(answer-sandler Classic Adam)
	=>
	
	(assert (UI-state (display "Wedding Singer")
					  (state final)
					  )))


(defrule just-go-with-it ""
	(answer-sandler New)
	=>
	
	(assert (UI-state (display "Just go with it")
					  (state final)
					  )))


(defrule american-pie ""
	(answer-good-or-bad-girl This one time)
	=>
	
	(assert (UI-state (display "American Pie")
					  (state final)
					  )))


(defrule girl-next-door ""
	(answer-good-or-bad-girl Nice girls never get the guy)
	=>
	
	(assert (UI-state (display "Girl next door")
					  (state final)
					  )))


(defrule drinking-buddies ""
	(answer-like-beer Yummy)
	=>
	
	(assert (UI-state (display "Drinking Buddies")
					  (state final)
					  )))

(defrule eteral-sunshine-of-the-spotless-mind ""
	(answer-tear-jerker I am not crying)
	=>
	
	(assert (UI-state (display "Eteral Sunsine of the spotless mind")
					  (state final)
					  )))

(defrule amelie ""
		(answer-foreign-film Oui)
    =>

    (assert (UI-state (display "Amelie")
                     (state final)
                     )))


(defrule the-notebook ""
		(answer-care-if-he-enjoys No)
    =>

    (assert (UI-state (display "The Netebook")
                     (state final)
                     )))

(defrule glimore ""
	(place Small-Town)
     =>
	(assert (UI-state (display GilmoreGirlsAnswer)
                      (state final)
                     )))

(defrule oitnb ""
	(place Prison)
     =>
	(assert (UI-state (display OitnbAnswer)
                      (state final)
                     )))						 

(defrule TopGun ""
	(answer-military-fan About face)
     =>
	(assert (UI-state (display "Top Gun")
                      (state final)
                     )))				
					 
(defrule MrAndMrsSmith ""
	(answer-male-or-female-lead Girls have muscle, too!)
     =>
	(assert (UI-state (display "Mr And Mrs Smith")
                      (state final)
                     )))		
					 

(defrule BourneIdentity ""
	(answer-male-or-female-lead Male)
     =>
	(assert (UI-state (display "Bourne Identity")
                      (state final)
                     )))	

						 
(defrule S24 ""
	(action Yes)
     =>
	(assert (UI-state (display S24Answer)
                      (state final)
                     )))					 
					 
(defrule Philadelphia ""
	(people Friend)
     =>
	(assert (UI-state (display PhiladelphiaAnswer)
                      (state final)
                     )))
					 
(defrule ArrestedDevelopment ""
	(people Family)
     =>
	(assert (UI-state (display ArrestedAnswer)
                      (state final)
                     )))
					 
(defrule Weed ""
	(drugs Yes)
     =>
	(assert (UI-state (display WeedsAnswer)
                      (state final)
                     )))
					 
(defrule TheOffice ""
	(work Yes)
     =>
	(assert (UI-state (display TheOfficeAnswer)
                      (state final)
                     )))
					 
(defrule FreaksAndGeeks ""
	(gentlemen Yes)
     =>
	(assert (UI-state (display FreaksAnswer)
                      (state final)
                     )))
					 
(defrule S30Rock ""
	(ladies Tina)
     =>
	(assert (UI-state (display S30RockAnswer)
                      (state final)
                     )))
					 
(defrule ParksAndRecreation ""
	(ladies Amy)
     =>
	(assert (UI-state (display ParksAnswer)
                      (state final)
                     )))
					 
(defrule Friday ""
	(football Yes)
     =>
	(assert (UI-state (display FridayAnswer)
                      (state final)
                     )))
					 
(defrule GreyAnatomy ""
	(hospitals Yes)
     =>
	(assert (UI-state (display AnatomyAnswer)
                      (state final)
                     )))
					 
(defrule Parenthood ""
	(hospitals No)
     =>
	(assert (UI-state (display ParenthoodAnswer)
                      (state final)
                     )))
					 
(defrule Scandal ""
	(romance Yes)
     =>
	(assert (UI-state (display ScandalAnswer)
                      (state final)
                     )))
					 
(defrule SilverLiningsPlaybook ""
	(answer-starring-an-it-girl Yes)
     =>
	(assert (UI-state (display "Silver Linings Playbook")
                      (state final)
                     )))
					 
(defrule BreakingBad ""
	(meth Yes)
     =>
	(assert (UI-state (display BreakingBadAnswer)
                      (state final)
                     )))
					 
(defrule MadMen ""
	(meth No)
     =>
	(assert (UI-state (display MadMenAnswer)
                      (state final)
                     )))
					 
(defrule Dexter ""
	(criminals Yes)
     =>
	(assert (UI-state (display DexterAnswer)
                      (state final)
                     )))
					 
(defrule TheWestWing ""
	(oorc Optimistic)
     =>
	(assert (UI-state (display WestAnswer)
                      (state final)
                     )))
					 
(defrule HouseOfCards ""
	(oorc Cynical)
     =>
	(assert (UI-state (display HouseAnswer)
                      (state final)
                     )))

(defrule TheVampireDiaries ""
	(vampires Yes)
     =>
	(assert (UI-state (display VampireAnswer)
                      (state final)
                     )))
					 
(defrule Supernatural ""
	(vampires No)
     =>
	(assert (UI-state (display SuperAnswer)
                      (state final)
                     )))
					 
(defrule HowIMetYourMother ""
	(barorcafe Bar)
     =>
	(assert (UI-state (display MotherAnswer)
                      (state final)
                     )))
					 
(defrule Friends ""
	(barorcafe Cafe)
     =>
	(assert (UI-state (display FriendsAnswer)
                      (state final)
                     )))
					 
(defrule CSI_Miami ""
	(forp Forensics)
     =>
	(assert (UI-state (display CSIAnswer)
                      (state final)
                     )))
					 
(defrule CriminalMinds ""
	(forp Psychology)
     =>
	(assert (UI-state (display MindsAnswer)
                      (state final)
                     )))

(defrule IdontKnow ""
	(declare (salience -10))
     =>
	(assert (UI-state (display IDKAnswer)
                      (state final)
                     )))			
					 
 					 				 	 			 					 			 	 	 		 			 				 		 		                   
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************


(defrule ask-question

	(declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
