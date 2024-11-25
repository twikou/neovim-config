;; extends

(call_expression
  function: (identifier) @name (#eq? @name "css")
  arguments: (template_string
			   (string_fragment) @injection.content)
  				(#set! injection.language "css"))

