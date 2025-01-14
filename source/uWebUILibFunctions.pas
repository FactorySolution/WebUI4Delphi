unit uWebUILibFunctions;

{$I uWebUI.inc}

{$MINENUMSIZE 4}

interface

uses
  uWebUIConstants, uWebUITypes;

var
  /// <summary>
  /// Create a new WebUI window object.
  /// </summary>
  /// <returns>Returns the window number.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_new_window)</see></para>
  /// </remarks>
  webui_new_window : function(): TWebUIWindowID; stdcall;

  /// <summary>
  /// Create a new webui window object using a specified window number.
  /// </summary>
  /// <param name="window_number">The window number (should be > 0, and < WEBUI_MAX_IDS).</param>
  /// <returns>Returns the window number.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_new_window_id)</see></para>
  /// </remarks>
  webui_new_window_id : function(window_number : TWebUIWindowID): TWebUIWindowID; stdcall;

  /// <summary>
  /// Get a free window number that can be used with `webui_new_window_id()`.
  /// </summary>
  /// <returns>Returns the first available free window number. Starting from 1.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_new_window_id)</see></para>
  /// </remarks>
  webui_get_new_window_id : function(): TWebUIWindowID; stdcall;

  /// <summary>
  /// Bind a specific html element click event with a function. Empty element means all events.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="element">The HTML ID.</param>
  /// <param name="func">The callback function.</param>
  /// <returns>Returns a unique bind ID.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_bind)</see></para>
  /// </remarks>
  webui_bind : function(window: TWebUIWindowID; const element: PWebUIChar; func: TWebUIBindCallback): TWebUIBindID; stdcall;

  /// <summary>
  /// Show a window using embedded HTML, or a file. If the window is already open, it will be refreshed.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="content">The HTML, URL, Or a local file.</param>
  /// <returns>Returns True if showing the window is successed.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_show)</see></para>
  /// </remarks>
  webui_show : function(window: TWebUIWindowID; const content: PWebUIChar): boolean; stdcall;

  /// <summary>
  /// Same as `webui_show()`. But using a specific web browser.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="content">The HTML, URL, Or a local file.</param>
  /// <param name="browser">The web browser to be used.</param>
  /// <returns>Returns True if showing the window is successed.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_show_browser)</see></para>
  /// </remarks>
  webui_show_browser : function(window: TWebUIWindowID; const content: PWebUIChar; browser: TWebUIBrowsers): boolean; stdcall;

  /// <summary>
  /// Set the window in Kiosk mode (Full screen).
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="status">True or False.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_kiosk)</see></para>
  /// </remarks>
  webui_set_kiosk : procedure(window: TWebUIWindowID; status: boolean); stdcall;

  /// <summary>
  /// Wait until all opened windows get closed.
  /// </summary>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_wait)</see></para>
  /// </remarks>
  webui_wait : procedure(); stdcall;

  /// <summary>
  /// Close a specific window only. The window object will still exist.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_close)</see></para>
  /// </remarks>
  webui_close : procedure(window: TWebUIWindowID); stdcall;

  /// <summary>
  /// Close a specific window and free all memory resources.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_destroy)</see></para>
  /// </remarks>
  webui_destroy : procedure(window: TWebUIWindowID); stdcall;

  /// <summary>
  /// Close all open windows. `webui_wait()` will return (Break).
  /// </summary>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_exit)</see></para>
  /// </remarks>
  webui_exit : procedure(); stdcall;

  /// <summary>
  /// Set the web-server root folder path for a specific window.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="path">The local folder full path.</param>
  /// <returns>Returns True if the function was successful.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_root_folder)</see></para>
  /// </remarks>
  webui_set_root_folder : function(window: TWebUIWindowID; const path: PWebUIChar): boolean; stdcall;

  /// <summary>
  /// Set the web-server root folder path for all windows. Should be used before `webui_show()`.
  /// </summary>
  /// <param name="path">The local folder full path.</param>
  /// <returns>Returns True if the function was successful.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_default_root_folder)</see></para>
  /// </remarks>
  webui_set_default_root_folder : function(const path: PWebUIChar): boolean; stdcall;

  /// <summary>
  /// Set a custom handler to serve files.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="handler">The handler function: `void myHandler(const char* filename, * int* length)`.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_file_handler)</see></para>
  /// </remarks>
  webui_set_file_handler : procedure(window: TWebUIWindowID; handler: TWebUIFileHandlerCallback); stdcall;

  /// <summary>
  /// Check if the specified window is still running.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <returns>Returns True if the window is still running.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_is_shown)</see></para>
  /// </remarks>
  webui_is_shown : function(window: TWebUIWindowID): boolean; stdcall;

  /// <summary>
  /// Set the maximum time in seconds to wait for the browser to start.
  /// </summary>
  /// <param name="second">The timeout in seconds.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_timeout)</see></para>
  /// </remarks>
  webui_set_timeout : procedure(second: NativeUInt); stdcall;

  /// <summary>
  /// Set the default embedded HTML favicon.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="icon">The icon as string: `<svg>...</svg>`.</param>
  /// <param name="icon_type">The icon type: `image/svg+xml`.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_icon)</see></para>
  /// </remarks>
  webui_set_icon : procedure(window: TWebUIWindowID; const icon, icon_type: PWebUIChar); stdcall;

  /// <summary>
  /// Base64 encoding. Use this to safely send text based data to the UI. If it fails it will return NULL.
  /// </summary>
  /// <param name="str">The string to encode (Should be null terminated).</param>
  /// <returns>Returns a encoded string.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_encode)</see></para>
  /// </remarks>
  webui_encode : function(const str: PWebUIChar): PWebUIChar; stdcall;

  /// <summary>
  /// Base64 decoding. Use this to safely decode received Base64 text from the UI. If it fails it will return NULL.
  /// </summary>
  /// <param name="str">The string to decode (Should be null terminated).</param>
  /// <returns>Returns a decoded string.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_decode)</see></para>
  /// </remarks>
  webui_decode : function(const str: PWebUIChar): PWebUIChar; stdcall;

  /// <summary>
  /// Safely free a buffer allocated by WebUI using `webui_malloc()`.
  /// </summary>
  /// <param name="ptr">The buffer to be freed.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_free)</see></para>
  /// </remarks>
  webui_free : procedure(ptr: Pointer); stdcall;

  /// <summary>
  /// Safely allocate memory using the WebUI memory management system. It can be safely freed using `webui_free()` at any time.
  /// </summary>
  /// <param name="size">The size of memory in bytes.</param>
  /// <returns>Returns a pointer to the allocated memory.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_malloc)</see></para>
  /// </remarks>
  webui_malloc : function(size: NativeUInt): Pointer; stdcall;

  /// <summary>
  /// Safely send raw data to the UI.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="function_">The JavaScript function to receive raw data: `function * myFunc(myData){}`.</param>
  /// <param name="raw">The raw data buffer.</param>
  /// <param name="size">The raw data size in bytes.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_send_raw)</see></para>
  /// </remarks>
  webui_send_raw : procedure(window: TWebUIWindowID; const function_: PWebUIChar; const raw: Pointer; size: NativeUInt); stdcall;

  /// <summary>
  /// Set a window in hidden mode. Should be called before `webui_show()`.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="status">The status: True or False.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_hide)</see></para>
  /// </remarks>
  webui_set_hide : procedure(window: TWebUIWindowID; status: boolean); stdcall;

  /// <summary>
  /// Set the window size.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="width">The window width.</param>
  /// <param name="height">The window height.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_size)</see></para>
  /// </remarks>
  webui_set_size : procedure(window: TWebUIWindowID; width, height: cardinal); stdcall;

  /// <summary>
  /// Set the window position.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="x">The window X.</param>
  /// <param name="y">The window Y.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_position)</see></para>
  /// </remarks>
  webui_set_position : procedure(window: TWebUIWindowID; x, y: cardinal); stdcall;

  /// <summary>
  /// Set the web browser profile to use. An empty `name` and `path` means the default user profile. Need to be called before `webui_show()`.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="name">The web browser profile name.</param>
  /// <param name="path">The web browser profile full path.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_profile)</see></para>
  /// </remarks>
  webui_set_profile : procedure(window: TWebUIWindowID; const name, path: PWebUIChar); stdcall;

  /// <summary>
  /// Get the full current URL.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <returns>Returns the full URL string.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_url)</see></para>
  /// </remarks>
  webui_get_url : function(window: TWebUIWindowID): PWebUIChar; stdcall;

  /// <summary>
  /// Allow a specific window address to be accessible from a public network.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="status">True or False.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_public)</see></para>
  /// </remarks>
  webui_set_public : procedure(window: TWebUIWindowID; status: boolean); stdcall;

  /// <summary>
  /// Navigate to a specific URL.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="url">Full HTTP URL.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_navigate)</see></para>
  /// </remarks>
  webui_navigate : procedure(window: TWebUIWindowID; const url: PWebUIChar); stdcall;

  /// <summary>
  /// Free all memory resources. Should be called only at the end.
  /// </summary>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_clean)</see></para>
  /// </remarks>
  webui_clean : procedure(); stdcall;

  /// <summary>
  /// Delete all local web-browser profiles folder. It should called at the end.
  /// </summary>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_delete_all_profiles)</see></para>
  /// </remarks>
  webui_delete_all_profiles : procedure(); stdcall;

  /// <summary>
  /// Delete a specific window web-browser local folder profile.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <remarks>
  /// <para>This can break functionality of other windows if using the same web-browser.</para>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_delete_profile)</see></para>
  /// </remarks>
  webui_delete_profile : procedure(window: TWebUIWindowID); stdcall;

  /// <summary>
  /// Get the ID of the parent process (The web browser may re-create another new process).
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <returns>Returns the the parent process id as integer.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_parent_process_id)</see></para>
  /// </remarks>
  webui_get_parent_process_id : function(window: TWebUIWindowID): NativeUInt; stdcall;

  /// <summary>
  /// Get the ID of the last child process.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <returns>Returns the the child process id as integer.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_child_process_id)</see></para>
  /// </remarks>
  webui_get_child_process_id : function(window: TWebUIWindowID): NativeUInt; stdcall;

  /// <summary>
  /// Set a custom web-server network port to be used by WebUI.
  /// This can be useful to determine the HTTP link of `webui.js` in case
  /// you are trying to use WebUI with an external web-server like NGNIX
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="port">The web-server network port WebUI should use.</param>
  /// <returns>Returns True if the port is free and usable by WebUI.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_port)</see></para>
  /// </remarks>
  webui_set_port : function(window: TWebUIWindowID; port: NativeUInt): boolean; stdcall;

  /// <summary>
  /// Set the SSL/TLS certificate and the private key content, both in PEM
  /// format. This works only with `webui-2-secure` library. If set empty WebUI
  /// will generate a self-signed certificate.
  /// </summary>
  /// <param name="certificate_pem">The SSL/TLS certificate content in PEM format.</param>
  /// <param name="private_key_pem">The private key content in PEM format.</param>
  /// <returns>Returns True if the certificate and the key are valid.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_tls_certificate)</see></para>
  /// </remarks>
  webui_set_tls_certificate : function(const certificate_pem, private_key_pem: PWebUIChar): boolean; stdcall;

  /// <summary>
  /// Run JavaScript without waiting for the response.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="script">The JavaScript to be run.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_run)</see></para>
  /// </remarks>
  webui_run : procedure(window: TWebUIWindowID; const script: PWebUIChar); stdcall;

  /// <summary>
  /// Run JavaScript and get the response back.
  /// Make sure your local buffer can hold the response.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="script">The JavaScript to be run.</param>
  /// <param name="timeout">The execution timeout.</param>
  /// <param name="buffer">The local buffer to hold the response.</param>
  /// <param name="buffer_length">The local buffer size.</param>
  /// <returns>Returns True if there is no execution error.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_script)</see></para>
  /// </remarks>
  webui_script : function(window: TWebUIWindowID; const script: PWebUIChar; timeout: NativeUInt; buffer: PWebUIChar; buffer_length: NativeUInt): boolean; stdcall;

  /// <summary>
  /// Chose between Deno and Nodejs as runtime for .js and .ts files.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="runtime">Deno or Nodejs.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_set_runtime)</see></para>
  /// </remarks>
  webui_set_runtime : procedure(window: TWebUIWindowID; runtime: TWebUIRuntime); stdcall;

  /// <summary>
  /// Get an argument as integer at a specific index.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="index">The argument position starting from 0.</param>
  /// <returns>Returns argument as integer.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_int_at)</see></para>
  /// </remarks>
  webui_get_int_at : function(e: PWebUIEvent; index: NativeUInt): int64; stdcall;

  /// <summary>
  /// Get the first argument as integer.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <returns>Returns argument as integer.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_int)</see></para>
  /// </remarks>
  webui_get_int : function(e: PWebUIEvent): int64; stdcall;

  /// <summary>
  /// Get an argument as string at a specific index.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="index">The argument position starting from 0.</param>
  /// <returns>Returns argument as string.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_string_at)</see></para>
  /// </remarks>
  webui_get_string_at : function(e: PWebUIEvent; index: NativeUInt): PWebUIChar; stdcall;

  /// <summary>
  /// Get the first argument as string.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <returns>Returns argument as string.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_string)</see></para>
  /// </remarks>
  webui_get_string : function(e: PWebUIEvent): PWebUIChar; stdcall;

  /// <summary>
  /// Get an argument as boolean at a specific index.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="index">The argument position starting from 0.</param>
  /// <returns>Returns argument as boolean.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_bool_at)</see></para>
  /// </remarks>
  webui_get_bool_at : function(e: PWebUIEvent; index: NativeUInt): boolean; stdcall;

  /// <summary>
  /// Get the first argument as boolean.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <returns>Returns argument as boolean.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_bool)</see></para>
  /// </remarks>
  webui_get_bool : function(e: PWebUIEvent): boolean; stdcall;

  /// <summary>
  /// Get the size in bytes of an argument at a specific index.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="index">The argument position starting from 0.</param>
  /// <returns>Returns size in bytes.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_size_at)</see></para>
  /// </remarks>
  webui_get_size_at : function(e: PWebUIEvent; index: NativeUInt): NativeUInt; stdcall;

  /// <summary>
  /// Get size in bytes of the first argument.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <returns>Returns size in bytes.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_get_size)</see></para>
  /// </remarks>
  webui_get_size : function(e: PWebUIEvent): NativeUInt; stdcall;

  /// <summary>
  /// Return the response to JavaScript as integer.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="n">The integer to be send to JavaScript.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_return_int)</see></para>
  /// </remarks>
  webui_return_int : procedure(e: PWebUIEvent; n: int64); stdcall;

  /// <summary>
  /// Return the response to JavaScript as string.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="s">The string to be send to JavaScript.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_return_string)</see></para>
  /// </remarks>
  webui_return_string : procedure(e: PWebUIEvent; const s: PWebUIChar); stdcall;

  /// <summary>
  /// Return the response to JavaScript as boolean.
  /// </summary>
  /// <param name="e">The event struct.</param>
  /// <param name="b">The boolean to be send to JavaScript.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_return_bool)</see></para>
  /// </remarks>
  webui_return_bool : procedure(e: PWebUIEvent; b: boolean); stdcall;

  /// <summary>
  /// Bind a specific HTML element click event with a function. Empty element means all events.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="element">The element ID.</param>
  /// <param name="func">The callback as myFunc(Window, EventType, Element, EventNumber, BindID).</param>
  /// <returns>Returns unique bind ID.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_bind)</see></para>
  /// </remarks>
  webui_interface_bind : function(window: TWebUIWindowID; const element: PWebUIChar; func: TWebUIInterfaceEventCallback): TWebUIBindID; stdcall;

  /// <summary>
  /// When using `webui_interface_bind()`, you may need this function to easily set a response.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="event_number">The event number.</param>
  /// <param name="response">The response as string to be send to JavaScript.</param>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_set_response)</see></para>
  /// </remarks>
  webui_interface_set_response : procedure(window: TWebUIWindowID; event_number: TWebUIEventID; const response: PWebUIChar); stdcall;

  /// <summary>
  /// Check if the app still running.
  /// </summary>
  /// <returns>Returns True if app is running.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_is_app_running)</see></para>
  /// </remarks>
  webui_interface_is_app_running : function(): boolean; stdcall;

  /// <summary>
  /// Get a unique window ID.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <returns>Returns the unique window ID as integer.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_get_window_id)</see></para>
  /// </remarks>
  webui_interface_get_window_id : function(window: TWebUIWindowID): TWebUIWindowID; stdcall;

  /// <summary>
  /// Get an argument as string at a specific index.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="event_number">The event number.</param>
  /// <param name="index">The argument position.</param>
  /// <returns>Returns argument as string.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_get_string_at)</see></para>
  /// </remarks>
  webui_interface_get_string_at : function(window: TWebUIWindowID; event_number: TWebUIEventID; index: NativeUInt): PWebUIChar; stdcall;

  /// <summary>
  /// Get an argument as integer at a specific index.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="event_number">The event number.</param>
  /// <param name="index">The argument position.</param>
  /// <returns>Returns argument as integer.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_get_int_at)</see></para>
  /// </remarks>
  webui_interface_get_int_at : function(window: TWebUIWindowID; event_number: TWebUIEventID; index: NativeUInt): int64; stdcall;

  /// <summary>
  /// Get an argument as boolean at a specific index.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="event_number">The event number.</param>
  /// <param name="index">The argument position.</param>
  /// <returns>Returns argument as boolean.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_get_bool_at)</see></para>
  /// </remarks>
  webui_interface_get_bool_at : function(window: TWebUIWindowID; event_number: TWebUIEventID; index: NativeUInt): boolean; stdcall;

  /// <summary>
  /// Get the size in bytes of an argument at a specific index.
  /// </summary>
  /// <param name="window">The window number.</param>
  /// <param name="event_number">The event number.</param>
  /// <param name="index">The argument position.</param>
  /// <returns>Returns size in bytes.</returns>
  /// <remarks>
  /// <para><see href="https://github.com/webui-dev/webui/blob/main/include/webui.h">WebUI source file: /include/webui.h (webui_interface_get_size_at)</see></para>
  /// </remarks>
  webui_interface_get_size_at : function(window: TWebUIWindowID; event_number: TWebUIEventID; index: NativeUInt): NativeUInt; stdcall;

implementation

end.
