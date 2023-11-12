(deftemplate user-response 
   (slot attribute)
   (slot destination)
   (slot beach-side)
   (slot transportation-mode)
   (slot planning-duration)
   (slot sanitary-facilities)
   (slot preference)
   (slot religion)
   (slot weather-preference)
   (slot luxury-hotels)
   (slot stay-near-airport)
   (slot wildlife-experience)
)

(defrule p1 => 
   (printout t crlf crlf "Are you traveling Alone, with friends or with family?" 
              crlf "  1. Alone" 
              crlf "  2. With friends" 
              crlf "  3. With family" 
              crlf crlf "Enter Your Answer (1|2|3): ") 
   (assert (user-response (attribute (read))))
)

(defrule ask-destination 
   ?ur <- (user-response (attribute 1)) 
   => 
   (printout t crlf crlf "Which destination are you looking for?" 
              crlf "  1. Beach" 
              crlf "  2. Hike" 
              crlf "  3. Camping" 
              crlf "  4. Religious" 
              crlf "  5. Relaxing" 
              crlf crlf "Enter Your Answer (1|2|3|4|5): ") 
   (modify ?ur (destination (read)))
)

(defrule ask-beach-preferences 
   ?ur <- (user-response (attribute 1) (destination 1)) 
   => 
   (printout t crlf crlf "Which side do you prefer?" 
              crlf "  1. Eastern" 
              crlf "  2. Western" 
              crlf "  3. Southern" 
              crlf crlf "Enter Your Answer (1|2|3): ") 
   (modify ?ur (beach-side (read)))
)

(defrule ask-beach-southern-own-vehicle 
   ?ur <- (user-response (attribute 1) (destination 1) (beach-side 3)) 
   => 
   (printout t crlf crlf "Do you own a vehicle?" 
              crlf "  1. Own-Vehicle" 
              crlf "  2. Public-Transport" 
              crlf crlf "Enter Your Answer (1|2): ") 
   (modify ?ur (transportation-mode (read)))
)

(defrule ask-hike-preferences
   ?ur <- (user-response (attribute 1) (destination 2))
   =>
   (printout t crlf crlf "What is your planning duration?" 
              crlf "  1. 1 Day (Easy)" 
              crlf "  2. 2/3 Days (Toughest)" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (planning-duration (read)))
)

(defrule ask-camping-preferences
   ?ur <- (user-response (attribute 1) (destination 3))
   =>
   (printout t crlf crlf "What is your preference on Sanitary Facilities?" 
              crlf "  1. No facilities" 
              crlf "  2. With facilities" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (sanitary-facilities (read)))
)

(defrule ask-with-camping-sanitary-preferences
   ?ur <- (user-response (attribute 1) (destination 3) (sanitary-facilities 2))
   =>
   (printout t crlf crlf "What is your preference side?" 
              crlf "  1. beach Side" 
              crlf "  2. mountain Side" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (preference (read)))
)

(defrule ask-religious-preferences
   ?ur <- (user-response (attribute 1) (destination 4))
   =>
   (printout t crlf crlf "What is your religion?" 
              crlf "  1. buddhism" 
              crlf "  2. hindu" 
              crlf "  3. other" 
              crlf crlf "Enter Your Answer (1|2|3): ")
   (modify ?ur (religion (read)))
)

(defrule ask-relaxing-preferences
   ?ur <- (user-response (attribute 1) (destination 5))
   =>
   (printout t crlf crlf "What is your weather preference?" 
              crlf "  1. cold & Cozy" 
              crlf "  2. sunny & Warm" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (weather-preference (read)))
)

(defrule ask-luxury-hotels-preferences
   ?ur <- (user-response (attribute 1) (destination 5) (weather-preference 2))
   =>
   (printout t crlf crlf "Do need luxury-hotels?" 
              crlf "  1. yes" 
              crlf "  2. no" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (luxury-hotels (read)))
)

(defrule ask-stay-near-airport-preferences
   ?ur <- (user-response (attribute 1) (destination 5) (weather-preference 2) (luxury-hotels 1))
   =>
   (printout t crlf crlf "Do need to stay-near-airport?" 
              crlf "  1. yes" 
              crlf "  2. no" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (stay-near-airport (read)))
)

(defrule ask-destination-with-friends
   ?ur <- (user-response (attribute 2))
   =>
   (printout t crlf crlf "Which of destination are you looking for?" 
              crlf "  1. Beach" 
              crlf "  2. Hike"
              crlf "  3. Relaxing" 
              crlf crlf "Enter Your Answer (1|2|3): ")
   (modify ?ur (destination (read)))
)

(defrule ask-beach-preferences-with-friends
   ?ur <- (user-response (attribute 2) (destination 1))
   =>
   (printout t crlf crlf "Which side do you prefer?" 
              crlf "  1. Eastern" 
              crlf "  2. Western" 
              crlf "  3. Southern" 
              crlf crlf "Enter Your Answer (1|2|3): ")
   (modify ?ur (beach-side (read)))
)

(defrule ask-beach-southern-own-vehicle-with-friends
   ?ur <- (user-response (attribute 2) (destination 1) (beach-side 3))
   =>
   (printout t crlf crlf "Do you own a vehicle?" 
              crlf "  1. Own-Vehicle" 
              crlf "  2. Public-Transport" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (transportation-mode (read)))
)

(defrule ask-hike-preferences-with-friends
   ?ur <- (user-response (attribute 2) (destination 2))
   =>
   (printout t crlf crlf "What is your planning duration?" 
              crlf "  1. 1 Day (Easy)" 
              crlf "  2. 2/3 Days (Toughest)" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (planning-duration (read)))
)

(defrule ask-hike-wildlife-experience-with-friends
   ?ur <- (user-response (attribute 2) (destination 2) (planning-duration 2))
   =>
   (printout t crlf crlf "Do you like wildlife-experience?" 
              crlf "  1. yes" 
              crlf "  2. no" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (wildlife-experience (read)))
)

(defrule ask-relaxing-preferences-with-friends
   ?ur <- (user-response (attribute 2) (destination 3))
   =>
   (printout t crlf crlf "What is your weather preference?" 
              crlf "  1. cold & Cozy" 
              crlf "  2. sunny & Warm" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (weather-preference (read)))
)

(defrule ask-relaxing-luxury-hotels-preferences-with-friends
   ?ur <- (user-response (attribute 2) (destination 3) (weather-preference 2))
   =>
   (printout t crlf crlf "Do you need luxury-hotels?" 
              crlf "  1. yes" 
              crlf "  2. no" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (luxury-hotels (read)))
)

(defrule ask-relaxing-luxury-hotels-stay-near-airport-preferences-with-friends
   ?ur <- (user-response (attribute 2) (destination 3) (weather-preference 2) (luxury-hotels 1))
   =>
   (printout t crlf crlf "Do need to stay-near-airport?" 
              crlf "  1. yes" 
              crlf "  2. no" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (stay-near-airport (read)))
)

(defrule ask-destination-with-family
   ?ur <- (user-response (attribute 3))
   =>
   (printout t crlf crlf "Which of destination are you looking for?" 
              crlf "  1. Relaxing" 
              crlf "  2. Religious" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (destination (read)))
)

(defrule ask-relaxing-preferences-with-family
   ?ur <- (user-response (attribute 3) (destination 1))
   =>
   (printout t crlf crlf "What is your weather preference?" 
              crlf "  1. cold & Cozy" 
              crlf "  2. sunny & Warm" 
              crlf crlf "Enter Your Answer (1|2): ")
   (modify ?ur (weather-preference (read)))
)




;----------- Recommendation -----------------------------




(defrule beach-eastern 
   ?ur <- (user-response (attribute 1) (destination 1) (beach-side 1)) 
   => 
   (printout t crlf crlf "Recommended Eastern Beaches:" 
              crlf "  - Panama Beach" 
              crlf "  - Pasikuda Beach" 
              crlf "  - Nilaweli Beach" 
              crlf crlf)
              (halt) ;
)


(defrule beach-western 
   ?ur <- (user-response (attribute 1) (destination 1) (beach-side 2)) 
   => 
   (printout t crlf crlf "Recommended Western Beaches:" 
              crlf "  - Panadura Beach" 
              crlf "  - Mt.Lavinia Beach" 
              crlf "  - Kaluthara Beach" 
              crlf crlf)
              (halt) ;
)

(defrule beach-southern-own-vehicle 
   ?ur <- (user-response (attribute 1) (destination 1) (beach-side 3) (transportation-mode 1)) 
   => 
   (printout t crlf crlf "Recommended Southern Beaches with Own Vehicle:" 
              crlf "  - Jungle Beach" 
              crlf "  - Secret Beach Mirissa" 
              crlf "  - Tangalle" 
              crlf crlf)(halt) ;
)

(defrule beach-southern-public-transport 
   ?ur <- (user-response (attribute 1) (destination 1) (beach-side 3) (transportation-mode 2)) 
   => 
   (printout t crlf crlf "Recommended Southern Beaches with Public Transport:" 
              crlf "  - Unawatuna Beach" 
              crlf "  - Jungle Beach" 
              crlf "  - Matara Beach" 
              crlf crlf)(halt) ;
)


(defrule hike-conclusions-1-day
    (attribute 1)
        (destination 2)
        (planning-duration 1)
   =>
   (printout t crlf crlf "Recommended Hike Destinations for 1 Day (Easy):" crlf
              "  - Ella Rock" crlf
              "  - Bathalegala" crlf
              "  - Hanthana Mountain" crlf crlf)(halt) ;
)

(defrule hike-conclusions-2-3-days
    (attribute 1)
        (destination 2)
        (planning-duration 2)
   =>
   (printout t crlf crlf "Recommended Hike Destinations for 2/3 Days (Toughest):" crlf
              "  - Knuckles" crlf
              "  - Adam's Peak" crlf
              "  - Madolsima" crlf crlf)(halt) ;
)

(defrule camping-conclusions-no-sanitary-facilities
    (attribute 1)
        (destination 3)
        (sanitary-facilities 1)
   =>
   (printout t crlf crlf "Recommended Camping Destinations without Proper Sanitary Facilities:" crlf
              "  - Panama Beach" crlf
              "  - Wangedigala" crlf
              "  - Wilpattu" crlf crlf)(halt) ;
)

(defrule camping-conclusions-beach-side
    (attribute 1)
        (destination 3)
        (sanitary-facilities 2)
        (preference 1)
   =>
   (printout t crlf crlf "Recommended Beach-side Camping Destinations with Proper Sanitary Facilities:" crlf
              "  - Blue Beach Island" crlf
              "  - Battalangunduwa Camping Site" crlf crlf)(halt) ;
)

(defrule camping-conclusions-mountain-side
   (attribute 1)
        (destination 3)
        (sanitary-facilities 2)
        (preference 2)
   =>
   (printout t crlf crlf "Recommended Mountain-side Camping Destinations with Proper Sanitary Facilities:" crlf
              "  - Wewathanna Camping Site" crlf crlf)(halt) ;
)

(defrule religious-conclusions-buddhism
    (attribute 1)
        (destination 4)
        (religion 1)
   =>
   (printout t crlf crlf "Recommended Buddhist Religious Destinations:" crlf
              "  - Anuradhapura" crlf
              "  - Polonnaruwa" crlf
              "  - Kandy" crlf crlf)(halt) ;
)

(defrule religious-conclusions-hindu
   (attribute 1)
        (destination 4)
        (religion 2)
   =>
   (printout t crlf crlf "Recommended Hindu Religious Destinations:" crlf
              "  - Jaffna" crlf
              "  - Polonnaruwa" crlf crlf)(halt) ;
)

(defrule religious-conclusions-other
    (attribute 1)
        (destination 4)
        (religion 3)
   =>
   (printout t crlf crlf "Recommended Other Religious Destinations:" crlf
              "  - Katharagama" crlf crlf)(halt) ;
)

(defrule relaxing-conclusions-cold-cozy
    (attribute 1)
        (destination 5)
        (weather-preference 1)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Cold & Cozy Weather:" crlf
              "  - Nuwaraeliya" crlf
              "  - Kandy" crlf
              "  - Hatton" crlf
              "  - Ella" crlf crlf)(halt) ;
)

(defrule relaxing-conclusions-sunny-warm-no-luxury
    (attribute 1)
        (destination 5)
        (weather-preference 2)
        (luxury-hotels 2)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Sunny & Warm Weather and No Luxurious Hotels:" crlf
              "  - Jaffna" crlf
              "  - Trincomalee" crlf
              "  - Chilaw" crlf
              "  - Panadura" crlf crlf)(halt) ;
)

(defrule relaxing-conclusions-sunny-warm-luxury-no-airport
    (attribute 1)
        (destination 5)
        (weather-preference 2)
        (luxury-hotels 2)
        (stay-near-airport 2)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Sunny & Warm Weather, Luxurious Hotels, and Not Near Airport:" crlf
              "  - Hikkaduwa" crlf
              "  - Hambantota" crlf
              "  - Polonnaruwa" crlf
              "  - Chilaw" crlf
              "  - Dambulla" crlf crlf)(halt) ;
)

(defrule relaxing-conclusions-sunny-warm-luxury-near-airport
    (attribute 1)
        (destination 5)
        (weather-preference 2)
        (luxury-hotels 2)
        (stay-near-airport 1)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Sunny & Warm Weather, Luxurious Hotels, and Near Airport:" crlf
              "  - Colombo" crlf crlf)(halt) ;
)


(defrule beach-eastern-with-friends
    (attribute 2)
        (destination 1)
        (beach-side 1)
   =>
   (printout t crlf crlf "Recommended Eastern Beaches for Friends:" crlf
              "  - Panama Beach" crlf
              "  - Pasikuda Beach" crlf
              "  - Nilaweli Beach" crlf crlf)(halt) ;
)

(defrule beach-western-with-friends
    (attribute 2)
        (destination 1)
        (beach-side 2)
   =>
   (printout t crlf crlf "Recommended Western Beaches for Friends:" crlf
              "  - Panadura Beach" crlf
              "  - Mt.Lavinia Beach" crlf
              "  - Kaluthara Beach" crlf crlf)(halt) ;
)



(defrule beach-southern-own-vehicle-with-friends
    (attribute 2)
        (destination 1)
        (beach-side 3)
        (transportation-mode 1)
   =>
   (printout t crlf crlf "Recommended Southern Beaches with Own Vehicle for Friends:" crlf
              "  - Jungle Beach" crlf
              "  - Secret Beach Mirissa" crlf
              "  - Tangalle" crlf crlf)(halt) ;
)

(defrule beach-southern-public-transport-with-friends
    (attribute 2)
        (destination 1)
        (beach-side 3)
        (transportation-mode 2)

   =>
   (printout t crlf crlf "Recommended Southern Beaches with Public Transport for Friends:" crlf
              "  - Unawatuna Beach" crlf
              "  - Hikkaduwa Beach" crlf
              "  - Matara Beach" crlf crlf)(halt) ;
)



(defrule hike-1-day-with-friends
    (attribute 2)
        (destination 2)
        (planning-duration 1)
   =>
   (printout t crlf crlf "Recommended Hike Destinations for 1 Day (Easy) with Friends:" crlf
              "  - Pidurangala Rock" crlf
              "  - Nonperial" crlf
              "  - Narangala" crlf
              "  - Ella Rock" crlf crlf)(halt) ;
)



(defrule hike-2-3-days-wildlife-yes-with-friends
    (attribute 2)
        (destination 2)
        (planning-duration 2)
        (wildlife-experience 1)
   =>
   (printout t crlf crlf "Recommended Hike Destinations for 2/3 Days (Tougher) with Wildlife Experience for Friends:" crlf
              "  - Knuckles" crlf
              "  - Namunukula" crlf
              "  - Meemure" crlf crlf)(halt) ;
)

(defrule hike-2-3-days-wildlife-no-with-friends
    (attribute 2)
        (destination 2)
        (planning-duration 2)
        (wildlife-experience 2)
   =>
   (printout t crlf crlf "Recommended Hike Destinations for 2/3 Days (Tougher) without Wildlife Experience for Friends:" crlf
              "  - Hawagala" crlf
              "  - Adam's Peak" crlf
              "  - Uda Diyaluma" crlf crlf)(halt) ;
)



(defrule relaxing-cold-cozy-with-friends
    (attribute 2)
        (destination 3)
        (weather-preference 1)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Cold & Cozy Weather for Friends:" crlf
              "  - Nuwaraeliya" crlf
              "  - Hatton" crlf
              "  - Ella" crlf crlf)(halt) ;
)

(defrule relaxing-sunny-warm-with-friends
    (attribute 2)
        (destination 3)
        (weather-preference 2)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Sunny & Warm Weather for Friends:" crlf
              "  - Jaffna" crlf
              "  - Trincomalee" crlf
              "  - Dambulla" crlf
              "  - Colombo" crlf crlf)(halt) ;
)




(defrule relaxing-cold-cozy-with-family
    (attribute 3)
        (destination 1)
        (weather-preference 1)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Cold & Cozy Weather for Family:" crlf
              "  - Nuwaraeliya" crlf
              "  - Hatton" crlf
              "  - Ella" crlf crlf)(halt) ;
)

(defrule relaxing-sunny-warm-with-family
    (attribute 3)
        (destination 1)
        (weather-preference 2)
   =>
   (printout t crlf crlf "Recommended Relaxing Destinations with Sunny & Warm Weather for Family:" crlf
              "  - Jaffna" crlf
              "  - Trincomalee" crlf
              "  - Dambulla" crlf
              "  - Colombo" crlf crlf)(halt) ;
)



(defrule religious-buddhism-with-family
    (attribute 3)
        (destination 2)
        (religion 1)
   =>
   (printout t crlf crlf "Recommended Buddhist Religious Destinations for Family:" crlf
              "  - Anuradhapura" crlf
              "  - Polonnaruwa" crlf
              "  - Kandy" crlf crlf)(halt) ;
)

(defrule religious-hindu-with-family
    (attribute 3)
        (destination 2)
        (religion 2)
   =>
   (printout t crlf crlf "Recommended Hindu Religious Destinations for Family:" crlf
              "  - Jaffna" crlf
              "  - Polonnaruwa" crlf crlf)(halt) ;
)

(defrule religious-other-with-family
    (attribute 3)
        (destination 2)
        (religion 3)
   =>
   (printout t crlf crlf "Recommended Other Religious Destinations for Family:" crlf
              "  - Katharagama" crlf crlf)(halt) ;
)

