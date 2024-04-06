import { Devs } from "@utils/constants";
import definePlugin from "@utils/types";

export default definePlugin({
    name: "AlwaysAnimate",
    description: "Animates anything that can be animated, besides status emojis.",
    authors: [Devs.FieryFlames],

    patches: [
        {
            find: ".canAnimate",
            all: true,
            replacement: {
                match: /\.canAnimate/g,
                replace: ".canAnimate || true"
            }
        }
    ]
});