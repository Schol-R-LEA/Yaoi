#!r6rs
(library
 (Yaoi)
 
 (export make-dispatchable-class)
 
 (import
   (rnrs base (6))
   (rnrs exceptions (6))
   (rnrs conditions (6))
   (Yaoi conditions))
 
 (define-syntax make-dispatchable-class
   (syntax-rules
    (methods)
    ((_ (?param-0 ...)
        (methods (?method-name-0 ?method-code-0) ...))
     (lambda (?param-0 ...)
             (lambda (dispatch . params)
                     (case dispatch
                       ((?method-name-0)
                        ((lambda ( . x) ?method-code-0) params)) ...
                       (else
                        ((add-error-reporting
                          'dispatchable-class
               				       make-invalid-message-violation))))))))))