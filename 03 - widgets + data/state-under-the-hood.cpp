// pseudocode tutorial on how state works under the hood in responsive UI frameworks

// my top-level goal: responsive UI

/* what that depends on:
  - being able to make changes in the UI without reloading the webpage
  - being able to re-render pieces of the UI
  - being able to preserve what was going on in those pieces (state) and
    reinjecting that state upon re-render
*/

class myComponent() {
   
    count = 0;

    render() {
        return `<p>You have pressed the button ${this.count} times.</p>`;
    }

}

// The way I'd want to use this is, any time the count changes, I fire the render method.
// ISSUE: updating count & re-rendering are not inherently connected - every developer using this
//        component has to remember to manually fire the (re-)render every time data changes.

c = myComponent();
c.count++;
// I have to MANUALLY remember to
c.render();
// otherwise, the object's data & what's being displayed to the user is different
// Imagine if there were TONS of data attributes in this component, TONS of compnents,
// tons of different files, thousands & millions of lines of code, and eeeeevery single time
// there was a change in data, that corresponding component's render() method would have to be manually fired.


// SO: The problem to solve is, "how can I automate the relationship between data change + re-render?"

class myComponent() {
   
    #count = 0; // answer: making this private! why?

    set count(n) {
        // every time external code tries to modify .count on an instance of 
        // myComponent, it HAS to go through this setter.

        this.#count = n; // this line gives me parity w/ what I had before: I can change the count.
        this.render();   // voila!

        // the 'trick': privately scope data -> require setter functions to change data ->
        //              end up in a function whenever i try to change data -> i'm in a function; now i
        //              can do whatever else i want (such as re-render). 
    }

    render() {
        return `<p>You have pressed the button ${this.count} times.</p>`;
    }

}

// Summary: we *co-opt* private/public scope in order to engineer a situation where we always end up in a function
//          when we try to change data. If we can always end up in a function, we can fire any other behaviour while
//          changing that data. In front-end, that behaviour we want to automatically fire is: re-rendering.
//          -> now we have an automated relationship between data changing + UI responding.