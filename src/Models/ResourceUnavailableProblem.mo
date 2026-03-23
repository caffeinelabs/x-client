
import { type DisallowedResourceProblemAllOfResourceType; JSON = DisallowedResourceProblemAllOfResourceType } "./DisallowedResourceProblemAllOfResourceType";

import { type Problem; JSON = Problem } "./Problem";

// ResourceUnavailableProblem.mo
/// A problem that indicates a particular Tweet, User, etc. is not available to you.

module {
    // User-facing type: what application code uses
    public type ResourceUnavailableProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        parameter : Text;
        resource_id : Text;
        resource_type : DisallowedResourceProblemAllOfResourceType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ResourceUnavailableProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            parameter : Text;
            resource_id : Text;
            resource_type : DisallowedResourceProblemAllOfResourceType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ResourceUnavailableProblem) : JSON = { value with
            resource_type = DisallowedResourceProblemAllOfResourceType.toJSON(value.resource_type);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ResourceUnavailableProblem {
            let ?resource_type = DisallowedResourceProblemAllOfResourceType.fromJSON(json.resource_type) else return null;
            ?{ json with
                resource_type;
            }
        };
    }
}
