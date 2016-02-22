;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun hello (&optional who)
  (if (not who)
      "Hello, World!"
    (format "Hello, %s!" who))
  )

(provide 'hello-world)
;;; hello-world.el ends here
