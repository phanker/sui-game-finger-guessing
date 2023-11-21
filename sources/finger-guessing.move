module game::finger_guessing{

    use std::vector;
    use std::string;
    use sui::event;

    struct Result has copy, drop {
        msg: string::String
    }

    public fun play(input_gesture: vector<u8>) {
        let all_gestures = vector::empty<string::String>();
        let rock = b"Rock";
        let scissors = b"Scissors";
        let paper = b"Paper";
        vector::push_back(&mut all_gestures, string::utf8(rock));
        vector::push_back(&mut all_gestures, string::utf8(scissors));
        vector::push_back(&mut all_gestures, string::utf8(paper));
        if (!vector::contains(&all_gestures, &string::utf8(input_gesture))) {
            event::emit(Result { msg: string::utf8(b"your input_gesture is invalid!") });
            return
        };
        let log1 = string::utf8(b"your input_gesture is :");
        string::append(&mut log1, string::utf8(input_gesture));

        let fixed_gesture = b"Rock";
        let log2 = string::utf8(b"computer's input_gesture is :");
        string::append(&mut log2, string::utf8(fixed_gesture));

        let log;
        if (input_gesture == fixed_gesture) {
            log = b"dogfall";
        }else if (input_gesture == scissors) {
            log = b"you lost!";
        }else {
            log = b"you win!";
        };

        let result = Result { msg: string::utf8(log) };
        event::emit(result);
    }
}

