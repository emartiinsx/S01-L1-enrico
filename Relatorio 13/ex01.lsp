(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar a erva em si mesma antes."
      "Erva liberada para o paciente."))

(defun main ()
  (let ((estoque (list (make-erva :nome "Flor da Lua" :preco-por-grama 2.5 :toxicidade 2)
                       (make-erva :nome "Folha de Jade" :preco-por-grama 3.5 :toxicidade 5)
                       (make-erva :nome "Raiz Sombria" :preco-por-grama 5.0 :toxicidade 8)))
        (gramas 4))
    (dolist (erva estoque)
      (format t "~a~%~a~%" (descreve-erva erva) (aviso erva)))
    (format t "Dose de ~a g de ~a: R$~,2f~%"
            gramas (erva-nome (car estoque))
            (preco-da-dose (car estoque) gramas))))

(main)