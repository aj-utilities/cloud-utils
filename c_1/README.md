# 3 Tier Resource Structure

- This folder provides sample cloudformation for 3 Tier resource creation.
- Modular approach is followed so that future changes can be managed easily.
- This helps in achieving re-usability.
- Please Note templates have not been tested, and are just to describe resource definition structure.
- Templates can be made more modular and can be used as lego bricks across various caller stacks.
- Modular templates provides flexibility to update only required stacks.


## Usage 
- AWS Cloudformation commands can be executed to create independent stacks using individual templates or all stacks using main template which has nested stack for each tier.
- Automation can be done from Jenkins or any other tools to create / update stacks. 

