#!r6rs
(library
 (Yaoi)
 
 (export make-dispatchable-class)
 
 (import
   (rnrs base (6))
   (rnrs exceptions (6))
   (rnrs conditions (6))
   (srfi 28)
   (Yaoi conditions)
   (Scheme-Exception-Utils error-reporting))
 
 (define-syntax make-dispatchable-class
   (syntax-rules
    (methods)
    ((_ (?param-0 ...)
        (methods (?method-name-0 ?method-code-0) ...))
     (lambda (?param-0 ...)
             (lambda
              (dispatch . params)
              (let ((report-error
                     (add-error-reporting
                      'dispatchable-class
             				     make-invalid-message-violation)))
                (case dispatch
                  ((?method-name-0)
                   ((lambda ( . x) ?method-code-0) params)) ...
                  (else (report-error
                          (format "~a: ~a is not a method name~%"
                                  'dispatchable-class dispatch)))))))))))
