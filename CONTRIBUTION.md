# Contribution Guide

## Dev Setup
- If you are using a private email for github you can get your private email as follows
  - ```
    gh_private_email=$(gh api /user/emails | jq '.[] | select(.email | contains("noreply"))' | jq '.email')
    git config --global user.email $gh_private_email
    ```