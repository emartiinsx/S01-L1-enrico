(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (let ((escuridao (garota-magica-escuridao g)))
    (make-garota-magica :nome (garota-magica-nome g)
                       :escuridao (if (>= quantidade escuridao)
                                      0
                                      (- escuridao quantidade))
                       :bruxas (garota-magica-bruxas g))))

(defun main ()
  (let ((grupo (list (make-garota-magica :nome "Mami" :escuridao 40 :bruxas 8)
                     (make-garota-magica :nome "Homura" :escuridao 30 :bruxas 6)
                     (make-garota-magica :nome "Kyoko" :escuridao 20 :bruxas 4))))
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo))
    (let ((novo-grupo (cons (make-garota-magica :nome "Sayaka" :escuridao 10 :bruxas 0)
                            grupo)))
      (format t "Escuridao do novo grupo: ~a~%" (escuridao-total novo-grupo))
      (format t "Escuridao do grupo original: ~a~%" (escuridao-total grupo)))
    (let* ((original (car grupo))
           (purificada (purifica original 15)))
      (format t "Escuridao original de ~a: ~a~%"
              (garota-magica-nome original) (garota-magica-escuridao original))
      (format t "Escuridao depois da purificacao: ~a~%"
              (garota-magica-escuridao purificada)))))

(main)