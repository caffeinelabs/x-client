/// A problem that indicates that you are not allowed to see a particular field on a Tweet, User, etc.

import { type DisallowedResourceProblemAllOfResourceType; JSON = DisallowedResourceProblemAllOfResourceType } "./DisallowedResourceProblemAllOfResourceType";

import { type DisallowedResourceProblemAllOfSection; JSON = DisallowedResourceProblemAllOfSection } "./DisallowedResourceProblemAllOfSection";

import { type Problem; JSON = Problem } "./Problem";

// FieldUnauthorizedProblem.mo

module {
    // User-facing type: what application code uses
    public type FieldUnauthorizedProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        field : Text;
        resource_type : DisallowedResourceProblemAllOfResourceType;
        section : DisallowedResourceProblemAllOfSection;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FieldUnauthorizedProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            field : Text;
            resource_type : DisallowedResourceProblemAllOfResourceType.JSON;
            section : DisallowedResourceProblemAllOfSection.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FieldUnauthorizedProblem) : JSON = { value with
            resource_type = DisallowedResourceProblemAllOfResourceType.toJSON(value.resource_type);
            section = DisallowedResourceProblemAllOfSection.toJSON(value.section);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FieldUnauthorizedProblem {
            let ?resource_type = DisallowedResourceProblemAllOfResourceType.fromJSON(json.resource_type) else return null;
            let ?section = DisallowedResourceProblemAllOfSection.fromJSON(json.section) else return null;
            ?{ json with
                resource_type;
                section;
            }
        };
    }
}
