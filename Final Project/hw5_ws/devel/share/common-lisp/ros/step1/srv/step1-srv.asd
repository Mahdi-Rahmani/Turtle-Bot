
(cl:in-package :asdf)

(defsystem "step1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetVFHData" :depends-on ("_package_GetVFHData"))
    (:file "_package_GetVFHData" :depends-on ("_package"))
  ))