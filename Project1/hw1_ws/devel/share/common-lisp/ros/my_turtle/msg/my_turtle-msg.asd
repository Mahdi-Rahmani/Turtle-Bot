
(cl:in-package :asdf)

(defsystem "my_turtle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "orientation" :depends-on ("_package_orientation"))
    (:file "_package_orientation" :depends-on ("_package"))
    (:file "proximity" :depends-on ("_package_proximity"))
    (:file "_package_proximity" :depends-on ("_package"))
  ))