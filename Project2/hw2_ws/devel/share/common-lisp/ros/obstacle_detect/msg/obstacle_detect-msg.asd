
(cl:in-package :asdf)

(defsystem "obstacle_detect-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "closest_obstacle" :depends-on ("_package_closest_obstacle"))
    (:file "_package_closest_obstacle" :depends-on ("_package"))
  ))