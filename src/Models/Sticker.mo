
// Sticker.mo

module {
    // User-facing type: what application code uses
    public type Sticker = {
        /// width-to-height ratio of the media
        aspect_ratio : ?Float;
        /// A unique identifier for the group of annotations associated with the media
        group_annotation_id : ?Float;
        /// Unique identifier for sticker
        id : ?Text;
        /// A unique identifier for the sticker set associated with the media
        sticker_set_annotation_id : ?Float;
        /// Scale or rotate the media on the x-axis
        transform_a : ?Float;
        /// Skew the media on the x-axis
        transform_b : ?Float;
        /// Skew the media on the y-axis
        transform_c : ?Float;
        /// Scale or rotate the media on the y-axis
        transform_d : ?Float;
        /// Scale or rotate the media on the x-axis
        transform_tx : ?Float;
        /// The vertical translation (shift) value for the media
        transform_ty : ?Float;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Sticker type
        public type JSON = {
            aspect_ratio : ?Float;
            group_annotation_id : ?Float;
            id : ?Text;
            sticker_set_annotation_id : ?Float;
            transform_a : ?Float;
            transform_b : ?Float;
            transform_c : ?Float;
            transform_d : ?Float;
            transform_tx : ?Float;
            transform_ty : ?Float;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Sticker) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Sticker = ?json;
    }
}
