(module discorbda (
                   +token+
                   evoke-api get post
                   users/get-me
                   channels/get channels/get-message channels/get-messages
                   )
(import scheme (chicken base) (chicken io) (chicken string) (chicken syntax))
(import http-client intarweb uri-common openssl )
(define +token+ "")

(client-software '(("DiscordBot" "mybot.com" "1.0" )))
(define (appler-api endpoint method writer)

  (with-input-from-request 
    (make-request
      method: method 
      uri: (uri-reference (conc "http://discord.com/api/v10/" endpoint))
      headers: (headers `(
                          (authorization #(,+token+ raw))
                          (content-type #(application/json ((charset . UTF-8)))) 
                          )))  writer read-string) )

(define (get endpoint)
  (appeler-api endpoint 'GET #f))

(define (post endpoint writer)
  (appeler-api endpoint 'POST writer))

;; ----GET----
(define (users/get-me)
  (get "users/@me"))

(define (channels/get channel-id)
  (get (conc "channels/" channel-id)))

(define (channels/get-message channel-id message-id)
  (get (conc "channels/" channel-id "messages/" message-id)))

(define (channels/get-messages channel-id)
  (get (conc "channels/" channel-id "messages")))

;; ----POST----
)
