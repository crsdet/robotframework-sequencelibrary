from robot.libraries.BuiltIn import register_run_keyword

from .keywords import SequenceKeywords


class SequenceLibrary(SequenceKeywords):
    """``SequenceLibrary`` is a Robot Framework library for running keywords in sequence.

    The following keywords are included:

    - `Run Sequence`
    """

    ROBOT_LIBRARY_SCOPE = "GLOBAL"


register_run_keyword("SequenceLibrary", "run_sequence", deprecation_warning=False)
