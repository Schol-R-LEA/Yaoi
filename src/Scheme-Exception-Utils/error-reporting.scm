#!r6rs

(library
 (Scheme-Exception-Utils error-reporting)
 (export
  add-error-reporting)
 
 (import
   (rnrs base (6))
   (rnrs exceptions (6))
   (rnrs conditions (6))
   (rnrs records syntactic (6)))
 
 (define-syntax 
   (errors)
   ((_ ?who ?cond-ctor)
    (lambda (msg)
            (raise
             (condition
              (make-who-condition ?who)
              (make-message-condition msg)
              (?cond-ctor)))))
   ((_ ?who ?cond-ctor (errors ?error-state-0 ...))
    (lambda (msg)
            (raise
             (condition
              (make-who-condition ?who)
              (make-message-condition msg)
              (?cond-ctor '?error-state-0 ...))))))))