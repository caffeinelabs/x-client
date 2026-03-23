
import { type DisallowedResourceProblemAllOfResourceType; JSON = DisallowedResourceProblemAllOfResourceType } "./DisallowedResourceProblemAllOfResourceType";

import { type Problem; JSON = Problem } "./Problem";

// ResourceNotFoundProblem.mo
/// A problem that indicates that a given Tweet, User, etc. does not exist.

module {
    // User-facing type: what application code uses
    public type ResourceNotFoundProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        parameter : Text;
        resource_id : Text;
        resource_type : DisallowedResourceProblemAllOfResourceType;
        /// Value will match the schema of the field.
        value : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResourceNotFoundProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            parameter : Text;
            resource_id : Text;
            resource_type : DisallowedResourceProblemAllOfResourceType.JSON;
            value : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResourceNotFoundProblem) : JSON = { value with
            resource_type = DisallowedResourceProblemAllOfResourceType.toJSON(value.resource_type);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResourceNotFoundProblem {
            let ?resource_type = DisallowedResourceProblemAllOfResourceType.fromJSON(json.resource_type) else return null;
            ?{ json with
                resource_type;
            }
        };
    }
}
