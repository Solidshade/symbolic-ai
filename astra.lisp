;;;; ASTRA - A small reasoning and learning AI
;;;; Version 0.1
;;;; Run in Common Lisp / Portacle

;;; 1. KNOWLEDGE BASE

(defparameter *facts*
  '(rain clouds cold))

(defparameter *rules*
  '(((rain clouds) wet-ground)
    ((wet-ground cold) slippery-road)))

;;; 2. LEARNING

(defun learn-fact (fact)
  "Store a new fact if it is not already known."
  (unless (member fact *facts*)
    (push fact *facts*)
    (format t "Astra learned: ~a~%" fact))
  fact)

;;; 3. REASONING ENGINE

(defun infer (facts rules)
  "Apply rules repeatedly until no new facts can be inferred."
  (let ((known (copy-list facts))
        (changed t))
    (loop while changed do
          (setf changed nil)
          (dolist (rule rules)
            (destructuring-bind (premises conclusion) rule
              (when (and
                     (every (lambda (fact)
                              (member fact known))
                            premises)
                     (not (member conclusion known)))
                (push conclusion known)
                (setf changed t)))))
    (nreverse known)))

;;; 4. ASK THE AI A QUESTION

(defun think ()
  "Update the knowledge base with every current inference."
  (setf *facts* (infer *facts* *rules*))
  *facts*)

(defun ask (question)
  "Check whether Astra knows a fact or can infer it."
  (if (member question (think*))
      (format t "Astra: I know ~a.~%" question)
      (format t "Astra: I don't know ~a yet.~%" question)))

(defun think* ()
  "Run the reasoning engine and return its conclusions."
  (think))

;;; 5. ADD NEW RULES

(defun learn-rule (premises conclusion)
  "Teach Astra a new rule."
  (let ((rule (list premises conclusion)))
    (unless (member rule *rules* :test #'equal)
      (push rule *rules*)
      (format t "Astra learned rule: ~a => ~a~%"
              premises conclusion))
    rule))

;;; 6. SAVE MEMORY TO A FILE

(defun save-memory (&optional (filename "astra-memory.lisp"))
  "Save the current facts and rules."
  (with-open-file (stream filename
                          :direction :output
                          :if-exists :supersede
                          :if-does-not-exist :create)
    (print (list *facts* *rules*) stream))
  (format t "Memory saved.~%"))

;;; 7. LOAD MEMORY FROM A FILE

(defun load-memory (&optional (filename "astra-memory.lisp"))
  "Restore previously saved facts and rules."
  (with-open-file (stream filename :direction :input)
    (let ((memory (read stream nil nil)))
      (when memory
        (setf *facts* (first memory)
              *rules* (second memory)))))
  (format t "Memory loaded.~%"))

;;; 8. START ASTRA

(defun start-astra ()
  (format t "~%Astra is online.~%")
  (format t "Known facts: ~a~%" (think)))
