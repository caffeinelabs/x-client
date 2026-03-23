
import { type ProcessingInfoState; JSON = ProcessingInfoState } "./ProcessingInfoState";

// ProcessingInfo.mo

module {
    // User-facing type: what application code uses
    public type ProcessingInfo = {
        /// Number of seconds to check again for status
        check_after_secs : ?Int;
        /// Percent of upload progress
        progress_percent : ?Int;
        state : ?ProcessingInfoState;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ProcessingInfo type
        public type JSON = {
            check_after_secs : ?Int;
            progress_percent : ?Int;
            state : ?ProcessingInfoState.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ProcessingInfo) : JSON = { value with
            state = do ? { ProcessingInfoState.toJSON(value.state!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ProcessingInfo {
            ?{ json with
                state = do ? { ProcessingInfoState.fromJSON(json.state!)! };
            }
        };
    }
}
