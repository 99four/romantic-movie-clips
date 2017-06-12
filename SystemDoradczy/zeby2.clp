
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

(defrule determine-type ""
	 (start)
    =>	
    (assert (UI-state (display DramaOrComedy)
                     (relation-asserted type)
                     (response Both )
                     (valid-answers Drama Comedy Both))))

(defrule determine-scifi ""
		(type Drama)
    =>

    (assert (UI-state (display ScifiShowQuestion)
                     (relation-asserted scifi)
                     (response No )
                     (valid-answers Yes No)))) 

(defrule determine-morals ""
		(type Comedy)
    =>

    (assert (UI-state (display QuestionableMoralsQuestion)
                     (relation-asserted morals)
                     (response No )
                     (valid-answers Yes No)))) 	


(defrule determine-place ""
		(type Both)
    =>

    (assert (UI-state (display TownOrPrisonQuestion)
                     (relation-asserted place)
                     (response Prison )
                     (valid-answers Small-Town Prison)))) 

(defrule determine-politics ""
		(scifi No)
    =>

    (assert (UI-state (display PoliticsQuestion)
                     (relation-asserted politics)
                     (response No )
                     (valid-answers Yes No)))) 	

(defrule determine-gore ""
		(scifi Yes)
    =>

    (assert (UI-state (display GoreQuestion)
                     (relation-asserted gore)
                     (response No )
                     (valid-answers Yes No)))) 	
					 
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
					 
(defrule determine-british ""
		(gore No)
    =>

    (assert (UI-state (display BritishCharQuestion)
                     (relation-asserted british)
                     (response Yes )
                     (valid-answers Yes No)))) 

(defrule determine-zombies ""
		(gore Yes)
    =>

    (assert (UI-state (display ZombiesQuestion)
                     (relation-asserted zombies)
                     (response Yes )
                     (valid-answers Yes No)))) 
					 
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
					 

(defrule determine-forp ""
		(romance No)
    =>

    (assert (UI-state (display VampiresQuestion)
                     (relation-asserted forp)
                     (response Forensics )
                     (valid-answers Forensics Psychology)))) 

					 
;;; ***************************
;;; *  FINAL  *  CONCLUSIONS  *
;;; *************************** 

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

(defrule DrWho ""
	(british Yes)
     =>
	(assert (UI-state (display DrWhoAnswer)
                      (state final)
                     )))	

(defrule Lost ""
	(british No)
     =>
	(assert (UI-state (display LostAnswer)
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
					 
(defrule WalkingDead ""
	(zombies Yes)
     =>
	(assert (UI-state (display DeadAnswer)
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
   
