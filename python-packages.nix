{ python, ... }:
[
  (python.withPackages (ps:
    with ps; [
      llm
      flask
      openai
      python-dotenv
      #together
    ]))
]
