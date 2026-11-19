(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list (make-criatura :nome "Peeper" :bioma "Safe Shallows"
                       :profundidade 20 :perigo :inofensiva)
        (make-criatura :nome "Stalker" :bioma "Kelp Forest"
                       :profundidade 70 :perigo :agressiva)
        (make-criatura :nome "Jellyray" :bioma "Mushroom Forest"
                       :profundidade 150 :perigo :inofensiva)
        (make-criatura :nome "Ghost Leviathan" :bioma "Lost River"
                       :profundidade 650 :perigo :leviata)))

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a - ~a - ~a m - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (let* ((metros 100)
         (criaturas-fundas (abaixo-de metros *catalogo*)))
    (format t "Catalogo completo~%")
    (dolist (texto (mapcar #'descreve-criatura *catalogo*))
      (format t "~a~%" texto))
    (format t "Criaturas abaixo de ~a m~%" metros)
    (dolist (texto (mapcar #'descreve-criatura criaturas-fundas))
      (format t "~a~%" texto))
    (format t "Total de criaturas filtradas: ~a~%" (length criaturas-fundas))))

(main)