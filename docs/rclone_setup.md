# Rclone Setup

When creating the credentials for rclone there are a few options and caveats

## OAuth

**Steps:**
- [Create A Client ID](https://rclone.org/drive/#making-your-own-client-id)
- Temporarily save the resulting client id and the client secret
    ```bash
    rclone_client_id=THE_COPIED_VALUE_FROM_GOOGLE_CONSOLE
    rclone_client_secret=THE_COPIED_VALUE_FROM_GOOGLE_CONSOLE
    ```
- Temporarily set a scope for your oauth access [Look here for examples](https://rclone.org/drive/#scopes)
  ```bash
  rclone_scope=drive
  ```

- Create a request object
  ```bash
  rclone_request_json="{\"client_id\":\"$rclone_client_id\",\"client_secret\":\"$rclone_client_secret\",\"scope\":\"$rclone_scope\"}' | base64 -w 0"
  ```

- Use rclone to generate a auth token
  ```bash
  rclone authorize "drive" "$rclone_request_json"
  ```

- The response in the terminal will be a long base64 encoded string. Copy that string and save it in the ansible credentials file for this project


**Important Caveats and Gotchas:**
Error `Invalid number of arguments: 2`

Some versions of `rclone authorize` don't base64 encode the oauth details. If you get this error use the below commands instead.
  ```
  rclone authorize "drive" "$rclone_request_client_id" "$rclone_request_client_secret"
  ```

https://rclone.org/remote_setup/