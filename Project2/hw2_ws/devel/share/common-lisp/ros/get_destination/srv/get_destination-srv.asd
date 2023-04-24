
(cl:in-package :asdf)

(defsystem "get_destination-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetNextDestination" :depends-on ("_package_GetNextDestination"))
    (:file "_package_GetNextDestination" :depends-on ("_package"))
  ))