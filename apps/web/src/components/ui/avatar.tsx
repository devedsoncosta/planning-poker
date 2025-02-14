import React from 'react';

interface AvatarProps {
    name: string;
}

export const Avatar: React.FC<AvatarProps> = ({ name }) => {
    const initials = name
        .split(' ')
        .map((word) => word[0].toUpperCase())
        .join('');

    return (
        <div className="flex items-center justify-center w-10 h-10 bg-gray-300 rounded-full">
            <span className="text-lg font-bold text-primary-foreground">{initials}</span>
        </div>
    );
};