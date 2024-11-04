# MartyMinnow
Can you save the Marty Minnow? An interactive experimental design challenge.

## Your challenge
The Marty Minnow is a rare fish, and a zoo is hoping to keep some to breed in captivity. The only problem is that they have no idea what conditions to keep them in.
They have tasked you to find out what conditions our marvelous minnows like. You can design an experiment, do a field study, or do both. Whatever you do comes with a cost, the design_study function will create your study and tell you how much it costs. You can then simulate the data you would collect with the study using the simulate_data function. Analyse this data to work out what conditions you recommend, then test if those really work for the minnows using the save_minnow function.

So to recap, all you need to do is:

mydata<-design_study() # Follow the interactive prompts

dat<-simulate_data(mydata) # Then analyse this data

save_minnow() # Have you succeeded?
