function alpha = SetDirectionOfMotionFrameOffset(qShoulder, qElbow, upperArmLength, lowerArmLength)

    % Compute the unit vector from the shoulder joint to the hand grasp point.
    dShoulderToHand = [(upperArmLength * cos(qShoulder)) + (lowerArmLength * cos(qShoulder + qElbow)), (upperArmLength * sin(qShoulder)) + (lowerArmLength * sin(qShoulder + qElbow))];
    uS2H = dShoulderToHand / norm(dShoulderToHand);
    % Compute the raw rotation
    alpha = acos(uS2H(1));
    if (dShoulderToHand(2) < 0)
        alpha = -alpha;
    end
end