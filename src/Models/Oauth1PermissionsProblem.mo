
import { type Problem; JSON = Problem } "./Problem";

// Oauth1PermissionsProblem.mo
/// A problem that indicates your client application does not have the required OAuth1 permissions for the requested endpoint.

module {
    // User-facing type: what application code uses
    public type Oauth1PermissionsProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Oauth1PermissionsProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Oauth1PermissionsProblem) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Oauth1PermissionsProblem = ?json;
    }
}
