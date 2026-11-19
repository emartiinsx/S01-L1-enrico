(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((dominios (remove-if-not
                    (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                    lista))
         (textos (mapcar (lambda (d)
                           (format nil "~a - ~,2f mora"
                                   (dominio-nome d) (recompensa-final d)))
                         dominios)))
    textos))

(defun main ()
  (let ((dominios (list (make-dominio :nome "Templo do Vento" :elemento :anemo
                                     :dificuldade 1 :mora 100)
                        (make-dominio :nome "Gruta das Mares" :elemento :hydro
                                     :dificuldade 2 :mora 200)
                        (make-dominio :nome "Ruinas do Trovao" :elemento :electro
                                     :dificuldade 3 :mora 300)
                        (make-dominio :nome "Salas de Gelo" :elemento :cryo
                                     :dificuldade 4 :mora 400)
                        (make-dominio :nome "Fortaleza das Chamas" :elemento :pyro
                                     :dificuldade 5 :mora 500)))
        (dificuldade-maxima 3))
    (format t "Rota ate a dificuldade ~a~%" dificuldade-maxima)
    (dolist (texto (rota dominios dificuldade-maxima))
      (format t "~a~%" texto))
    (format t "Total de mora de todos os dominios: ~,2f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))
    (let* ((original (car dominios))
           (copia (copy-dominio original)))
      (setf (dominio-mora copia) 250)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora original)))))

(main)