
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     
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

(defrule determine-he-likes-animation ""
		(with-who My family)
    =>

    (assert (UI-state (display "Do you like animation?")
                    (relation-asserted answer-he-likes-animation)
                    (response No )
                    (valid-answers Yes No))))

  (defrule determine-pixar-or-disney ""
		(answer-he-likes-animation Yes)
    =>

    (assert (UI-state (display "Pixar or Disney?")
                    (relation-asserted answer-pixar-or-disney)
                    (response "What about Burton" )
                    (valid-answers "What about Burton" Pixar Disney))))

  (defrule determine-holidays-make-him-swoon ""
		(answer-he-likes-animation No)
    =>

    (assert (UI-state (display "Do the holidays make you swoon?")
                    (relation-asserted answer-holidays-make-him-swoon)
                    (response "I wish it was Christmas everyday" )
                    (valid-answers "I wish it was Christmas everyday" "Not really"))))

  (defrule determine-kids-or-adults ""
		(answer-holidays-make-him-swoon Not really)
    =>

    (assert (UI-state (display "Little kids or young adults?")
                    (relation-asserted answer-kids-or-adults)
                    (response "Somethings for the kiddies please" )
                    (valid-answers "Somethings for the kiddies please" "We have teens in the house"))))

  (defrule determine-princess-movie ""
		(answer-kids-or-adults Somethings for the kiddies please)
    =>

    (assert (UI-state (display "How about a princess movie?")
                    (relation-asserted answer-princess-movie)
                    (response "My son will barf" )
                    (valid-answers "My son will barf" "The girls would love that" "Something gender neutral"))))
  
  (defrule determine-like-black-white-films ""
		(answer-holidays-make-him-swoon I wish it was Christmas everyday)
    =>

    (assert (UI-state (display "Do you like black & white films?")
                    (relation-asserted answer-like-black-white-films)
                    (response "Always love the classics" )
                    (valid-answers "Always love the classics" "Maybe something more modern"))))

  (defrule determine-how-many-love-triangles ""
		(answer-like-black-white-films Maybe something more modern)
    =>

    (assert (UI-state (display "How many love triangles?")
                    (relation-asserted answer-how-many-love-triangles)
                    (response "I love complexity" )
                    (valid-answers "I love complexity" "More than two and its hard to follow"))))

  (defrule determine-robots-or-humans ""
		(answer-pixar-or-disney Pixar)
    =>

    (assert (UI-state (display "With robots or humans?")
                    (relation-asserted answer-robots-or-humans)
                    (response Robots )
                    (valid-answers Robots Humans))))

  (defrule determine-lover-or-fighter ""
		(answer-pixar-or-disney Disney)
    =>

    (assert (UI-state (display "Are you a lover or fighter?")
                    (relation-asserted answer-lover-or-fighter)
                    (response Fighter )
                    (valid-answers Fighter Lover))))


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

(defrule moonrise-kingdom ""
	(answer-princess-movie My son will barf)
	=>
	
	(assert (UI-state (display "Moonrise Kingdom")
					  (state final)
					  )))

(defrule enchanted ""
	(answer-princess-movie The girls would love that)
	=>
	
	(assert (UI-state (display "Enchanted")
					  (state final)
					  )))

(defrule princess-bride ""
	(answer-princess-movie Something gender neutral)
	=>
	
	(assert (UI-state (display "Princess Bride")
					  (state final)
					  )))            

(defrule its-a-wonderful-life ""
	(answer-like-black-white-films Always love the classics)
	=>
	
	(assert (UI-state (display "Its a wonderful life")
					  (state final)
					  )))

(defrule love-actually ""
	(answer-how-many-love-triangles I love complexity)
	=>
	
	(assert (UI-state (display "Love actually")
					  (state final)
					  )))

(defrule the-holiday ""
	(answer-how-many-love-triangles More than two and its hard to follow)
	=>
	
	(assert (UI-state (display "The holiday")
					  (state final)
					  )))

(defrule nightmare-before-christmas ""
	(answer-pixar-or-disney What about Burton)
	=>
	
	(assert (UI-state (display "Nightmare Before Christmas")
					  (state final)
					  )))

(defrule wall-e ""
	(answer-robots-or-humans Robots)
	=>
	
	(assert (UI-state (display "Wall E")
					  (state final)
					  )))

(defrule up ""
	(answer-robots-or-humans Humans)
	=>
	
	(assert (UI-state (display "Up")
					  (state final)
					  )))

(defrule tangled ""
	(answer-lover-or-fighter Fighter)
	=>
	
	(assert (UI-state (display "Tangled")
					  (state final)
					  )))

(defrule beauty-and-the-beast ""
	(answer-lover-or-fighter Lover)
	=>
	
	(assert (UI-state (display "Beauty and the Beast")
					  (state final)
					  )))

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

					 
(defrule SilverLiningsPlaybook ""
	(answer-starring-an-it-girl Yes)
     =>
	(assert (UI-state (display "Silver Linings Playbook")
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
   
