/// A problem that indicates that a usage cap has been exceeded.

import { type Problem; JSON = Problem } "./Problem";

import { type UsageCapExceededProblemAllOfPeriod; JSON = UsageCapExceededProblemAllOfPeriod } "./UsageCapExceededProblemAllOfPeriod";

import { type UsageCapExceededProblemAllOfScope; JSON = UsageCapExceededProblemAllOfScope } "./UsageCapExceededProblemAllOfScope";

// UsageCapExceededProblem.mo

module {
    // User-facing type: what application code uses
    public type UsageCapExceededProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        period : ?UsageCapExceededProblemAllOfPeriod;
        scope : ?UsageCapExceededProblemAllOfScope;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UsageCapExceededProblem type
        public type JSON = {
            detail : ?Text;
            status : ?Int;
            title : Text;
            type_ : Text;
            period : ?UsageCapExceededProblemAllOfPeriod.JSON;
            scope : ?UsageCapExceededProblemAllOfScope.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UsageCapExceededProblem) : JSON = { value with
            period = do ? { UsageCapExceededProblemAllOfPeriod.toJSON(value.period!) };
            scope = do ? { UsageCapExceededProblemAllOfScope.toJSON(value.scope!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UsageCapExceededProblem {
            ?{ json with
                period = do ? { UsageCapExceededProblemAllOfPeriod.fromJSON(json.period!)! };
                scope = do ? { UsageCapExceededProblemAllOfScope.fromJSON(json.scope!)! };
            }
        };
    }
}
