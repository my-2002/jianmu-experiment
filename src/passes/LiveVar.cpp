#include "LiveVar.hpp"

#include <iostream>
#include <set>

using namespace std;

/*void LiveVar::printLiveVars() {
    cout << "Live Variable Sets" << endl;
    for (auto bb : cfg) {
        cout << "Basic Block " << bb->label << endl;
        cout << "  Live In: ";
        for (auto liveIn : bb->liveIn) {
            cout << liveIn << " ";
        }
        cout << endl;
        cout << "  Live Out: ";
        for (auto liveOut : bb->liveOut) {
            cout << liveOut << " ";
        }
        cout << endl;
    }
}*/
void LiveVarAnalysis::run() {
    // Code goes here
    // Step 1: Initialize the live variable sets for each basic block
    initializeLiveVars();

    // Step 2: Iterate until convergence
    bool changed = true;
    while (changed) {
        changed = false;

        // Step 3: Traverse the basic blocks in reverse order
        for (auto it = cfg.rbegin(); it != cfg.rend(); ++it) {
            BasicBlock* bb = *it;

            computeGenKill(bb);
            computeLiveInLiveOut(bb);
            // Step 6: Update the live variable sets for the current basic block
            if (liveIn[bb] != preliveIn[bb]) {
                changed = true;
                preliveIn[bb] = liveIn[bb];
            }

            if (liveOut[bb] != preliveOut[bb]) {
                changed = true;
                preliveOut[bb] = liveOut[bb];
            }
        }
    }

    // Step 7: Print the live variable sets for each basic block
    //printLiveVars();
}