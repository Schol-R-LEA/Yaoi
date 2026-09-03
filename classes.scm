#!r6rs
(library
 (Yaoi classes)
 
 (export make-class)
 
 (import
  (rnrs base (6))
  (rnrs exceptions (6))
  (rnrs conditions (6))
  (rnrs syntax-case (6))
  (srfi 28 format)
  (srfi 88 keywords)
  (Yaoi conditions)
  (Scheme-Exception-Utils error-reporting))
 
 
 (define-syntax
  make-class
  (lambda (stx)

    (syntax-case stx
        (members methods)
      ((_ (members ?member-initializer-0 ...)
          (methods (?method-definition-0) ...))
      (lambda (?member-0 ...)
        (lambda
            (dispatch . params)
          (let ((report-error
                  (add-error-reporting
                  'make-class
                  make-invalid-message-violation)))
            (case dispatch
              (method (?method-name-0)
                            ((lambda (?method-arg-0 ...) ?method-body-0) params)) ...
              (else (report-error
                      (format "~a: ~a is not a method name~%" 'make-class dispatch))))))))))
 
 
 (define-syntax
  method
  (lambda ()
    (syntax-case
     ()
     ((_ ?method-name (?method-arg-0 ...) method-body)
      (let ((?method-name
             (lambda (?method-arg-0 ...) method-body)))
        ?method-name)))
    