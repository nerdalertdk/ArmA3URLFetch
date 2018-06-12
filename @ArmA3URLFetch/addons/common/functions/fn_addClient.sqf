
/*
	Author(s):
		Vincent Heins (original)

	Description:
		This function is used to add a client to the extension.
		More about the usage here: https://github.com/TheMysteriousVincent/ArmA3URLFetch/wiki/Usage
	
	Example(s):
		(Example 1)
		private _clientID = ["https://httpbin.org/get", "GET", ["hey=there"], true] call a3uf_common_fnc_addClient;
		//_clientID = <int>
*/

params [
	["_url", "", [""]],
	["_method", "", [""]],
	["_params", [], [[]]],
	["_headers", [], [[]]],
	["_decodeJson", false, [false]]
];

if (_url == "") exitWith { 0; };

private _args = [];
_args append ["#url", _url];

if (_method != "") then {
	_args append ["#method", _method];
};

if ((count _params) > 0) then {
	_args append _params;
};

if ((count _headers) > 0) then {
	_args append _headers;
};

if (_decodeJson) then
{
	_args pushBack "#jsonToArray";
};

private _res = [];
_res = ("arma3urlfetch" callExtension ["ADDCLI", _args]);
(parseNumber (_res select 0));
