#!r6rs
(library (Yaoi)

  (export make-dispatchable-class)

  (import
    (rnrs base (6))
    (rnrs syntax-case (6))
    (srfi 1)
    (srfi 88))

  (define-syntax make-dispatchable-class
    (syntax-rules (methods)
      ((_ (param-0 ...)
          (methods (method-name-0 method-code-0) ...))
        (lambda (param-0 ...)
          (lambda (dispatch . params)
            (case dispatch
              ((method-name-0)
               ((lambda ( . x) method-code-0) params)) ...)))))))

; (define cls (make-dispatchable-class (foo bar baz)
;                                      (methods
;                                        (quux (display foo))
;                                        (zark (display baz)))))
; (pretty-print
;   (tree-il->scheme
;     (macroexpand '(make-dispatchable-class (foo bar baz)
;                                            (methods
;                                              (quux (display foo))
;                                              (zark (display baz)))))))



; (define obj (cls 1 2 3))

; ((obj 'zark))

; (lambda (foo bar baz)
;   (lambda (dispatch . params)
;     (let ((key dispatch))
;       (cond
;         (((memv key 'quux) ((display foo)))
;          ((memv key 'zark) ((display baz))))))))

; (define obj-0
;   ((lambda (foo bar baz)
;     (lambda (dispatch . params)
;       (let ((key dispatch))
;         (cond
;           (((memv key '(quux)) (display foo)))
;            ((memv key '(zark)) (display baz))))))
;       1 2 3))

;  (obj-0 'zark)

;   (define-syntax define-alist
;     (syntax-rules (pairs pair)
;       ((_ id (pairs (pair key value) ...))
;        (define id (list (list key value) ...)))))

;   (define-alist foo (pairs (pair 'a 0) (pair 'b 1) (pair 'c 2)))

;   (define-syntax populate-alist
;     (syntax-rules (pairs pair)
;       ((_ (pairs (pair key value) ...))
;         (list (list key value) ...))))

; (populate-alist (pairs (pair 'a 0) (pair 'b 1) (pair 'c 2)))

      ; ;; ctor with no parameters
      ; ((_ <class-name> (initialization <init-code>)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0> <cls-pub-init-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...)))
      ;  (_ <class-name> ()
      ;                  (initialization <init-code>)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0>
      ;                                          <cls-pub-init-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...))))

      ; ;; ctor with no initializer
      ; ((_ <class-name> (<param-0> ...)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0> <cls-pub-init-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...)))
      ;  (_ <class-name> (<param-0> ...)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0>
      ;                                          <cls-pub-init-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...))))


      ; ;; ctor with no public class-members
      ; ((_ <class-name> (<param-0> ...)
      ;                  (initialization <init-code>)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...)))
      ;  (_ <class-name> (<param-0> ...)
      ;                  (initialization <init-code>)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public ())
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...))))


      ; ;; ctor with no private class members
      ; ((_ <class-name> (<param-0> ...)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0> <cls-pub-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0> <cls-priv-code-0>) ...)))
      ;  (_ <class-name> (<param-0> ...)
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0> <cls-pub-init-0>) ...)
      ;                                 (private ()))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...))))

      ; ;; ctor with no parameters or initializer
      ; ((_ <class-name> (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0> <cls-pub-init-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0> <cls-priv-code-0>) ...)))
      ;  (_ <class-name> ()
      ;                  (initialization (lambda () '())
      ;                  (members (public (<pub-mem-name-0> <pub-init-0>) ...)
      ;                           (private (<priv-mem-name-0> <priv-init-0>) ...))
      ;                  (methods (public (<pub-method-name-0> <pub-code-0>) ...)
      ;                           (private (<priv-method-name-0> <priv-code-0>) ...))
      ;                  (class-members (public (<cls-pub-mem-name-0> <cls-pub-init-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-mem-name-0> <cls-priv-init-0>) ...))
      ;                  (class-methods (public
      ;                                   (<cls-pub-method-name-0> <cls-pub-code-0>) ...)
      ;                                 (private
      ;                                   (<cls-priv-method-name-0>
      ;                                    <cls-priv-code-0>) ...))))
